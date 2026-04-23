import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/ble_config.dart';
import '../models/calibration_profile.dart';
import '../models/session_summary.dart';
import '../models/vital_snapshot.dart';
import '../services/ble_service.dart';
import '../services/payload_parser.dart';
import '../services/storage_service.dart';

enum AppMode { pulseCheck, hemoglobinStatus }

class HemePulseAppState extends ChangeNotifier {
  final BleService _bleService;
  final StorageService _storageService;

  StreamSubscription<List<ScanResult>>? _scanSub;
  StreamSubscription<BleUpdate>? _updateSub;
  StreamSubscription<bool>? _connectionSub;

  List<ScanResult> scanResults = <ScanResult>[];
  bool scanning = false;
  bool connecting = false;
  bool connected = false;

  VitalSnapshot latest = VitalSnapshot.empty();
  final List<VitalSnapshot> trend = <VitalSnapshot>[];
  final List<SessionSummary> sessionHistory = <SessionSummary>[];

  CalibrationProfile calibration = const CalibrationProfile.defaults();
  AppMode mode = AppMode.pulseCheck;

  String? alertMessage;
  String? lastError;

  // Pulse check state
  bool pulseCheckActive = false;

  final List<VitalSnapshot> _sessionSamples = <VitalSnapshot>[];
  final List<int> _sourceTimestamps = <int>[];
  final List<int> _ambientSeries = <int>[];
  final List<int> _redSeries = <int>[];
  final List<int> _irSeries = <int>[];
  final List<double> _ratioSeries = <double>[];

  int _consecutiveSuspicious = 0;

  HemePulseAppState({BleService? bleService, StorageService? storageService})
      : _bleService = bleService ?? BleService(),
        _storageService = storageService ?? StorageService();

  Future<void> initialize() async {
    calibration = await _storageService.loadCalibrationProfile();
    final history = await _storageService.loadSessionHistory();
    sessionHistory
      ..clear()
      ..addAll(history);

    _scanSub = _bleService.scanResultsStream.listen((results) {
      scanResults = results;
      notifyListeners();
    });

    _updateSub = _bleService.updates.listen(_onBleUpdate);

    _connectionSub = _bleService.connectionState.listen((value) {
      final wasConnected = connected;
      connected = value;

      if (connected && !wasConnected) {
        _startSessionBuffers();
      }

      if (!connected && wasConnected) {
        pulseCheckActive = false;
        unawaited(_finalizeSession());
      }

      if (!connected) {
        alertMessage = 'Device disconnected';
      }
      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> startScan() async {
    scanning = true;
    lastError = null;
    notifyListeners();

    try {
      await requestPermissions();
      await _bleService.startScan();
      await Future<void>.delayed(const Duration(seconds: 4));
    } catch (error) {
      lastError = error.toString();
    }

    scanning = false;
    notifyListeners();
  }

  Future<void> requestPermissions() async {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return;
    }

    final statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    final deniedPermissions = statuses.entries
        .where((entry) => !entry.value.isGranted)
        .map((entry) => entry.key)
        .toList();

    if (deniedPermissions.isNotEmpty) {
      throw StateError(
        'BLE permissions are required. Please allow Bluetooth and Location permissions in Android settings.',
      );
    }
  }

  Future<void> connectToScanResult(ScanResult result) async {
    connecting = true;
    lastError = null;
    notifyListeners();

    try {
      await _bleService.connect(result.device);
      connected = true;
      _startSessionBuffers();
      alertMessage = null;
      await _bleService.requestSnapshot();
    } catch (error) {
      connected = false;
      lastError = error.toString();
    }

    connecting = false;
    notifyListeners();
  }

  Future<void> disconnect() async {
    pulseCheckActive = false;
    await _finalizeSession();
    await _bleService.disconnect();
    connected = false;
    notifyListeners();
  }

  void setMode(AppMode newMode) {
    mode = newMode;
    notifyListeners();
  }

  // ── Pulse Check Control ──

  Future<void> startPulseCheck() async {
    if (!connected) {
      lastError = 'Connect the device first.';
      notifyListeners();
      return;
    }
    lastError = null;

    try {
      await _bleService.startBpmMode();
      pulseCheckActive = true;
      alertMessage = 'Pulse check active. Red LED is flashing. Keep still for 30-45 seconds.';
    } catch (error) {
      pulseCheckActive = false;
      lastError = 'Failed to start pulse check: $error';
    }

    notifyListeners();
  }

  Future<void> stopPulseCheck() async {
    lastError = null;

    if (connected) {
      try {
        await _bleService.stopBpmMode();
      } catch (error) {
        lastError = 'Failed to stop pulse check: $error';
      }
    }

    pulseCheckActive = false;
    alertMessage = null;
    notifyListeners();
  }

  // ── Hemoglobin Baseline ──

  Future<void> requestSnapshot() async {
    if (!connected) {
      return;
    }
    await _bleService.requestSnapshot();
  }

  Future<void> startBaselineCapture() async {
    if (!connected) {
      lastError = 'Connect the device first.';
      notifyListeners();
      return;
    }

    await _bleService.startBaselineCapture();
    alertMessage = 'Baseline capture started (60 seconds). Keep still.';
    notifyListeners();
  }

  Future<void> clearBaseline() async {
    calibration = calibration.copyWith(userBaselineR: 0, baselineValid: false);
    await _storageService.saveCalibrationProfile(calibration);

    if (connected) {
      await _bleService.clearBaseline();
    }

    notifyListeners();
  }

  Future<void> saveCalibration({
    required double photodiodeSensitivityAw,
    required double amplifierGainVPerA,
    required double baselineVoltageMv,
    required double userBaselineR,
    required bool baselineValid,
  }) async {
    calibration = calibration.copyWith(
      photodiodeSensitivityAw: photodiodeSensitivityAw,
      amplifierGainVPerA: amplifierGainVPerA,
      baselineVoltageMv: baselineVoltageMv,
      userBaselineR: userBaselineR,
      baselineValid: baselineValid,
    );

    await _storageService.saveCalibrationProfile(calibration);

    if (connected) {
      await _bleService.writeControlCommand(
        'CAL_PD=${photodiodeSensitivityAw.toStringAsFixed(6)}',
      );
      await _bleService.writeControlCommand(
        'CAL_GAIN=${amplifierGainVPerA.toStringAsFixed(6)}',
      );
      await _bleService.writeControlCommand(
        'CAL_VREF=${baselineVoltageMv.toStringAsFixed(2)}',
      );

      if (baselineValid && userBaselineR > 0) {
        await _bleService.writeControlCommand(
          'BASE_SET=${userBaselineR.toStringAsFixed(6)}',
        );
      }
    }

    notifyListeners();
  }

  String warningLabel(WarningState warning) {
    switch (warning) {
      case WarningState.normal:
        return 'Normal';
      case WarningState.elevated:
        return 'Elevated';
      case WarningState.high:
        return 'High';
      case WarningState.lowSignal:
        return 'Low Signal';
      case WarningState.baselineNeeded:
        return 'Baseline Needed';
      case WarningState.unknown:
        return 'Unknown';
    }
  }

  // ── Hemoglobin Status (multi-test consensus) ──

  /// Number of Hb tests completed (sessions with valid ratio data)
  int get hbTestCount {
    return sessionHistory.where((s) => s.ratioR > 0 && s.confidence >= 40).length;
  }

  /// Hb status confidence: increases with more consistent tests
  double get hbStatusConfidence {
    final tests = sessionHistory
        .where((s) => s.ratioR > 0 && s.confidence >= 40)
        .toList();
    if (tests.isEmpty) return 0;
    final avgConf = tests.fold<double>(0, (sum, s) => sum + s.confidence) / tests.length;
    // Scale by test count (max confidence when 5+ tests)
    final countFactor = math.min(1.0, tests.length / 5.0);
    return avgConf * countFactor;
  }

  /// Main Hb status label based on multi-test consensus
  String get hbStatusLabel {
    if (!calibration.baselineValid || calibration.userBaselineR <= 0) {
      return 'Baseline Needed';
    }

    final validTests = sessionHistory
        .where((s) => s.ratioR > 0 && s.confidence >= 40)
        .toList();

    if (validTests.length < 4) {
      return 'Collecting Data (${validTests.length}/4 tests)';
    }

    // Use last 5 tests for consensus
    final recent = validTests.reversed.take(5).toList();
    int dangerCount = 0;
    int cautionCount = 0;

    for (final test in recent) {
      final drift = ((test.ratioR - calibration.userBaselineR) /
              calibration.userBaselineR)
          .abs();
      if (drift >= 0.12) {
        dangerCount++;
      } else if (drift >= 0.07) {
        cautionCount++;
      }
    }

    // Relative Hb percentage estimate (crude but meaningful for trends)
    final avgDrift = recent.fold<double>(0, (sum, s) {
          return sum +
              ((s.ratioR - calibration.userBaselineR) /
                      calibration.userBaselineR)
                  .abs();
        }) /
        recent.length;

    // Map drift to percentage: 0% drift = 100%, >25% drift = ~50%
    final hbPct = math.max(0.0, 1.0 - avgDrift * 2.0) * 100;

    if (hbPct < 50 && dangerCount >= 3) {
      return 'DANGER — Seek Medical Attention';
    }
    if (hbPct < 75 && (dangerCount >= 2 || cautionCount >= 3)) {
      return 'Caution — Low Hemoglobin Trend';
    }
    if (cautionCount >= 2) {
      return 'Slight Concern — Monitor Closely';
    }
    return 'Normal';
  }

  /// Status color
  Color get hbStatusColor {
    final label = hbStatusLabel;
    if (label.startsWith('DANGER')) return const Color(0xFFD32F2F);
    if (label.startsWith('Caution')) return const Color(0xFFE65100);
    if (label.startsWith('Slight')) return const Color(0xFFF9A825);
    if (label.startsWith('Collecting')) return const Color(0xFF1565C0);
    if (label.startsWith('Baseline')) return Colors.grey;
    return const Color(0xFF2E7D32);
  }

  // ── Adaptive Baseline Drift ──
  /// Gradually adjusts baseline if readings consistently drift over multiple sessions
  Future<void> _checkAdaptiveBaselineDrift() async {
    if (!calibration.baselineValid || calibration.userBaselineR <= 0) return;

    final validTests = sessionHistory
        .where((s) => s.ratioR > 0 && s.confidence >= 55 && !s.motionLikely)
        .toList();

    // Need at least 8 stable sessions before considering drift adaptation
    if (validTests.length < 8) return;

    final recent = validTests.reversed.take(8).toList();
    final avgRatio = recent.fold<double>(0, (sum, s) => sum + s.ratioR) /
        recent.length;

    final drift = (avgRatio - calibration.userBaselineR) /
        calibration.userBaselineR;

    // If drift is small but consistent (2-5%), nudge the baseline
    if (drift.abs() >= 0.02 && drift.abs() <= 0.05) {
      // Check consistency: all 8 sessions should drift in same direction
      final allSameDirection = recent.every((s) =>
          ((s.ratioR - calibration.userBaselineR) > 0) == (drift > 0));

      if (allSameDirection) {
        // Nudge baseline by 30% of the drift
        final newBaseline =
            calibration.userBaselineR * (1.0 + drift * 0.3);
        calibration = calibration.copyWith(
          userBaselineR: newBaseline,
          baselineValid: true,
        );
        await _storageService.saveCalibrationProfile(calibration);
      }
    }
  }

  Future<void> disposeState() async {
    await _finalizeSession();
    await _scanSub?.cancel();
    await _updateSub?.cancel();
    await _connectionSub?.cancel();
    await _bleService.dispose();
  }

  void _onBleUpdate(BleUpdate update) {
    if (update.characteristicUuid == BleConfig.packetUuid) {
      final packet = PayloadParser.parseSensorPacket(update.value);
      if (packet == null) {
        return;
      }

        final double ratio = packet.ratioR > 0
          ? packet.ratioR
          : (packet.irCorrected == 0
            ? 0.0
            : packet.redCorrected.toDouble() /
              packet.irCorrected.toDouble());

      _appendRawSeries(packet, ratio);

      // BPM: compute on app side from RED signal drops (valleys)
      final bpm = _estimateBpmFromDrops();
      final motionLikely = _isMotionLikely();
      final confidence = _estimateConfidence(packet, bpm, motionLikely);
      final warning = _estimateWarning(ratio, confidence, motionLikely);

      int flags = packet.flags;
      if (bpm > 0) {
        flags |= 0x01;
      }
      if (motionLikely) {
        flags |= 0x40;
      }

      latest = VitalSnapshot(
        timestamp: DateTime.now(),
        sourceTimestampMs: packet.timestampMs,
        bpm: bpm,
        ratioR: ratio,
        confidence: confidence,
        warning: warning,
        ambientRaw: packet.ambientRaw,
        redRaw: packet.redCorrected,
        irRaw: packet.irCorrected,
        motionLikely: motionLikely,
        flags: flags,
      );

      trend.add(latest);
      if (trend.length > 600) {
        trend.removeAt(0);
      }

      _sessionSamples.add(latest);
      if (_sessionSamples.length > 2000) {
        _sessionSamples.removeAt(0);
      }

      _updateAlert(latest);
      notifyListeners();
      return;
    }

    if (update.characteristicUuid == BleConfig.baselineUuid) {
      if (!_hasMinimumPayloadLength(update.characteristicUuid, update.value)) {
        return;
      }

      _mergeBaselinePayload(update.value);
      notifyListeners();
      return;
    }
  }

  bool _hasMinimumPayloadLength(Guid uuid, List<int> bytes) {
    if (uuid == BleConfig.packetUuid) {
      return bytes.length >= 17;
    }

    if (uuid == BleConfig.baselineUuid) {
      return bytes.length >= 5;
    }

    return bytes.isNotEmpty;
  }

  void _mergeBaselinePayload(List<int> bytes) {
    if (bytes.length < 5) {
      return;
    }

    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    final baseline = data.getFloat32(0, Endian.little).toDouble();
    final valid = bytes[4] == 1;

    calibration = calibration.copyWith(
      userBaselineR: baseline,
      baselineValid: valid,
    );

    _storageService.saveCalibrationProfile(calibration);
  }

  void _updateAlert(VitalSnapshot snapshot) {
    // Don't override pulse check alert
    if (pulseCheckActive) return;

    if (snapshot.motionLikely) {
      alertMessage =
          'Reading unstable due to movement. Keep finger/ear-lobe still and retake.';
      return;
    }

    if (snapshot.warning == WarningState.high) {
      alertMessage =
          'Repeated high drift from baseline across stable samples. Recheck promptly.';
      return;
    }

    if (snapshot.warning == WarningState.elevated) {
      alertMessage =
          'Elevated baseline drift detected over multiple samples. Monitor closely.';
      return;
    }

    if (snapshot.warning == WarningState.lowSignal ||
        snapshot.confidence < 40) {
      alertMessage = 'Low signal confidence. Reposition sensor on ear-lobe.';
      return;
    }

    if (snapshot.warning == WarningState.baselineNeeded) {
      alertMessage = 'Baseline required. Go to Hemoglobin Status to capture one.';
      return;
    }

    alertMessage = null;
  }

  void _startSessionBuffers() {
    _consecutiveSuspicious = 0;
    _sessionSamples.clear();
    _sourceTimestamps.clear();
    _ambientSeries.clear();
    _redSeries.clear();
    _irSeries.clear();
    _ratioSeries.clear();
  }

  void _appendRawSeries(SensorPacket packet, double ratio) {
    _sourceTimestamps.add(packet.timestampMs);
    _ambientSeries.add(packet.ambientRaw);
    _redSeries.add(packet.redCorrected);
    _irSeries.add(packet.irCorrected);
    _ratioSeries.add(ratio);

    const int maxLen = 2200;
    if (_sourceTimestamps.length > maxLen) {
      _sourceTimestamps.removeAt(0);
      _ambientSeries.removeAt(0);
      _redSeries.removeAt(0);
      _irSeries.removeAt(0);
      _ratioSeries.removeAt(0);
    }
  }

  /// BPM estimation using valley/drop detection on the RED corrected signal.
  /// Drops (sudden falls) in the RED signal correspond to heartbeat pulses.
  int _estimateBpmFromDrops() {
    if (_redSeries.length < 30) {
      return 0;
    }

    final int start = math.max(0, _redSeries.length - 300);
    final List<double> filtered = <double>[];
    final List<int> ts = <int>[];

    // Apply 5-point moving average baseline removal
    for (int i = start + 2; i < _redSeries.length - 2; i++) {
      final double ma = (_redSeries[i - 2] +
              _redSeries[i - 1] +
              _redSeries[i] +
              _redSeries[i + 1] +
              _redSeries[i + 2]) /
          5.0;
      filtered.add(_redSeries[i] - ma);
      ts.add(_sourceTimestamps[i]);
    }

    if (filtered.length < 8) {
      return 0;
    }

    // Compute statistics for threshold
    double sum = 0;
    for (final value in filtered) {
      sum += value;
    }
    final double mean = sum / filtered.length;

    double variance = 0;
    for (final value in filtered) {
      final double d = value - mean;
      variance += d * d;
    }
    variance /= filtered.length;

    final double stddev = math.sqrt(variance);
    // Valley threshold: look for drops BELOW this negative threshold
    final double threshold = mean - math.max(1.5, stddev * 0.4);

    // Detect local valleys (sudden drops = heartbeat in PPG)
    final List<int> valleys = <int>[];
    for (int i = 1; i < filtered.length - 1; i++) {
      final bool localValley = filtered[i] < filtered[i - 1] &&
          filtered[i] <= filtered[i + 1] &&
          filtered[i] < threshold;
      if (!localValley) {
        continue;
      }

      final int valleyTs = ts[i];
      if (valleys.isEmpty || (valleyTs - valleys.last) >= 320) {
        valleys.add(valleyTs);
      }
    }

    if (valleys.length < 2) {
      return 0;
    }

    final List<int> intervals = <int>[];
    for (int i = 1; i < valleys.length; i++) {
      final int interval = valleys[i] - valleys[i - 1];
      if (interval >= 300 && interval <= 1500) {
        intervals.add(interval);
      }
    }

    if (intervals.length < 2) {
      return 0;
    }

    final double avgInterval =
        intervals.reduce((a, b) => a + b) / intervals.length;
    final int bpm = (60000.0 / avgInterval).round();
    if (bpm < 40 || bpm > 190) {
      return 0;
    }

    return bpm;
  }

  bool _isMotionLikely() {
    if (_irSeries.length < 12 && _redSeries.length < 12) {
      return false;
    }

    // Use whichever series has data (RED-only mode may have no IR)
    final series = _redSeries.length >= 12 ? _redSeries : _irSeries;
    if (series.length < 12) return false;

    final int start = math.max(1, series.length - 20);
    double diff = 0;
    double seriesMean = 0;
    int count = 0;

    for (int i = start; i < series.length; i++) {
      diff += (series[i] - series[i - 1]).abs();
      seriesMean += series[i].toDouble().abs();
      count++;
    }

    if (count == 0) {
      return false;
    }

    seriesMean = seriesMean / count;
    final double norm = (diff / count) / math.max(5.0, seriesMean);

    return norm > 0.22;
  }

  int _estimateConfidence(SensorPacket packet, int bpm, bool motionLikely) {
    int score = packet.confidence;

    if (bpm == 0) {
      score -= 12;
    }
    // In pulse mode, only RED is active so don't penalize for low IR
    if (!pulseCheckActive) {
      if (packet.irCorrected < 18) {
        score -= 20;
      }
    }
    if (packet.redCorrected < 10) {
      score -= 12;
    }
    if (_signalSpan(_redSeries, 60) < 4) {
      score -= 12;
    }
    if (motionLikely) {
      score -= 25;
    }

    return score.clamp(0, 100).toInt();
  }

  int _signalSpan(List<int> values, int maxTail) {
    if (values.isEmpty) {
      return 0;
    }

    final int start = math.max(0, values.length - maxTail);
    int minValue = values[start];
    int maxValue = values[start];
    for (int i = start + 1; i < values.length; i++) {
      if (values[i] < minValue) {
        minValue = values[i];
      }
      if (values[i] > maxValue) {
        maxValue = values[i];
      }
    }

    return maxValue - minValue;
  }

  WarningState _estimateWarning(
      double ratio, int confidence, bool motionLikely) {
    final bool hasBaseline =
        calibration.baselineValid && calibration.userBaselineR > 0;
    if (!hasBaseline) {
      return WarningState.baselineNeeded;
    }

    if (motionLikely || confidence < 35) {
      return WarningState.lowSignal;
    }

    final double drift =
        ((ratio - calibration.userBaselineR) / calibration.userBaselineR).abs();

    if (drift >= 0.07 && confidence >= 55) {
      _consecutiveSuspicious += 1;
    } else {
      _consecutiveSuspicious = math.max(0, _consecutiveSuspicious - 1);
    }

    final bool repeatedSessionDrift = _hasRepeatedSessionDrift();

    if (drift >= 0.12 &&
        (_consecutiveSuspicious >= 8 || repeatedSessionDrift)) {
      return WarningState.high;
    }
    if (drift >= 0.07 && _consecutiveSuspicious >= 3) {
      return WarningState.elevated;
    }

    return WarningState.normal;
  }

  bool _hasRepeatedSessionDrift() {
    if (!calibration.baselineValid || calibration.userBaselineR <= 0) {
      return false;
    }

    int driftSessions = 0;
    final Iterable<SessionSummary> recent =
        sessionHistory.skip(math.max(0, sessionHistory.length - 4));

    for (final SessionSummary summary in recent) {
      if (summary.confidence < 55 || summary.motionLikely) {
        continue;
      }
      final double drift =
          ((summary.ratioR - calibration.userBaselineR) / calibration.userBaselineR)
              .abs();
      if (drift >= 0.07) {
        driftSessions += 1;
      }
    }

    return driftSessions >= 3;
  }

  Future<void> _finalizeSession() async {
    if (_sessionSamples.length < 5) {
      return;
    }

    double sumRed = 0;
    double sumIr = 0;
    double sumRatio = 0;
    int sumConfidence = 0;
    int sumBpm = 0;
    int bpmCount = 0;
    int motionCount = 0;

    for (final VitalSnapshot item in _sessionSamples) {
      sumRed += item.redRaw;
      sumIr += item.irRaw;
      sumRatio += item.ratioR;
      sumConfidence += item.confidence;
      if (item.bpm > 0) {
        sumBpm += item.bpm;
        bpmCount += 1;
      }
      if (item.motionLikely) {
        motionCount += 1;
      }
    }

    final int count = _sessionSamples.length;
    final SessionSummary summary = SessionSummary(
      timestamp: DateTime.now(),
      avgRed: sumRed / count,
      avgIr: sumIr / count,
      ratioR: sumRatio / count,
      bpm: bpmCount > 0 ? (sumBpm / bpmCount).round() : latest.bpm,
      confidence: (sumConfidence / count).round(),
      warning: _sessionSamples.last.warning,
      motionLikely: motionCount * 2 >= count,
    );

    sessionHistory.add(summary);
    if (sessionHistory.length > 120) {
      sessionHistory.removeAt(0);
    }

    await _storageService.saveSessionHistory(sessionHistory);

    // Check for adaptive baseline drift after saving session
    await _checkAdaptiveBaselineDrift();

    _startSessionBuffers();
  }

  @override
  void dispose() {
    disposeState();
    super.dispose();
  }
}
