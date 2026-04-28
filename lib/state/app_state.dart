import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../config/ble_config.dart';
import '../models/calibration_profile.dart';
import '../models/hb_predictor.dart';
import '../models/session_summary.dart';
import '../models/vital_snapshot.dart';
import '../services/ble_service.dart';
import '../services/payload_parser.dart';
import '../services/storage_service.dart';

class HemePulseAppState extends ChangeNotifier {
  // ===========================================================================
  // 🛠️ EDIT THESE VALUES TO ADJUST SENSOR READINGS MANUALLY 🛠️
  // ===========================================================================
  // If you want to subtract a value from the RAW IR reading, put it here.
  // For example, to subtract 70000 from the raw ADC: IR_RAW_SUBTRACT = 70000.0
  static const double IR_RAW_SUBTRACT = 0;

  // If you want to divide the RAW IR reading, change this (1.0 means no division).
  // For example, to reduce it by 141.5 times: IR_RAW_DIVISOR = 141.5
  static const double IR_RAW_DIVISOR = 1;
  // ===========================================================================

  final BleService _bleService;
  final StorageService _storageService;

  StreamSubscription<List<ScanResult>>? _scanSub;
  StreamSubscription<BleUpdate>? _updateSub;
  StreamSubscription<bool>? _connectionSub;

  // ── BLE state ──
  List<ScanResult> scanResults = <ScanResult>[];
  bool scanning = false;
  bool connecting = false;
  bool connected = false;

  // ── Calibration ──
  CalibrationProfile calibration = const CalibrationProfile.defaults();

  // ── User Profile (mandatory before scanning) ──
  int? userAge;
  String? userGender; // "Male", "Female", "Other"

  bool get profileComplete => userAge != null && userGender != null;

  // ── Scanning state ──
  bool isScanning = false;
  int scanProgress = 0; // 0-100
  Timer? _scanTimer;
  int _scanElapsedMs = 0;
  static const int kScanDurationMs = 20000; // 20 seconds

  // ── Latest results ──
  double lastHbValue = 0.0;
  int lastBpm = 0;
  int lastSpo2 = 0;
  String healthState = 'Healthy';
  DateTime? lastScanTime;
  double currentFingerRed = 0.0;
  double currentFingerIr = 0.0;

  // ── Scan history (persisted) ──
  List<Map<String, dynamic>> scanHistory = [];

  // ── Raw data buffers ──
  final List<int> _sourceTimestamps = <int>[];
  final List<int> _redSeries = <int>[];
  final List<int> _irSeries = <int>[];
  final List<int> _ambientSeries = <int>[];
  final List<int> _recentPeaks = <int>[];

  // Buffers for the current 20-second scan only
  final List<double> _scanRedBuffer = <double>[];
  final List<double> _scanIrBuffer = <double>[];
  final List<int> _scanTsBuffer = <int>[];
  final List<int> _scanBpmChunks = <int>[];
  final List<double> _scanSpo2Chunks = <double>[];
  bool _repositionNeeded = false;

  // ── Baseline capture accumulators ──
  // These fill during the 60s no-finger baseline capture from actual BLE samples.
  bool _isCapturingBaseline = false;
  final List<int> _baselineRedAccum = <int>[];
  final List<int> _baselineIrAccum = <int>[];

  // ── Exposed for Settings UI ──
  /// Median no-finger Red ADC (from last successful baseline capture).
  double get baselineRedDisplay => calibration.baselineRedAdc;

  /// Median no-finger IR ADC (from last successful baseline capture).
  double get baselineIrDisplay => calibration.baselineIrAdc;

  // ── UI Exposed ──
  List<int> get redSeries => _redSeries;
  List<int> get sourceTimestamps => _sourceTimestamps;
  List<int> get recentPeaks => _recentPeaks;

  String? alertMessage;
  String? lastError;

  HemePulseAppState({BleService? bleService, StorageService? storageService})
      : _bleService = bleService ?? BleService(),
        _storageService = storageService ?? StorageService();

  Future<void> initialize() async {
    calibration = await _storageService.loadCalibrationProfile();
    userAge = await _storageService.loadAge();
    userGender = await _storageService.loadGender();
    scanHistory = await _storageService.loadScanHistory();

    _scanSub = _bleService.scanResultsStream.listen((results) {
      scanResults = results;
      notifyListeners();
    });

    _updateSub = _bleService.updates.listen(_onBleUpdate);

    _connectionSub = _bleService.connectionState.listen((value) {
      final wasConnected = connected;
      connected = value;

      if (!connected && wasConnected) {
        if (isScanning) stopScan();
      }
      if (connected && !wasConnected) {
        // Nothing to do
      }
      notifyListeners();
    });

    notifyListeners();
  }

  void clearAlert() {
    alertMessage = null;
    if (isScanning) {
      stopScan();
    }
    notifyListeners();
  }

  // ═══════════════════════════════════════════
  // BLE Scanning & Connection
  // ═══════════════════════════════════════════

  Future<void> startBleScan() async {
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
    if (defaultTargetPlatform != TargetPlatform.android) return;

    final statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
    ].request();

    final denied = statuses.entries
        .where((e) => !e.value.isGranted)
        .map((e) => e.key)
        .toList();

    if (denied.isNotEmpty) {
      throw StateError(
          'BLE permissions required. Allow Bluetooth and Location.');
    }
  }

  Future<void> connectToScanResult(ScanResult result) async {
    connecting = true;
    lastError = null;
    notifyListeners();

    try {
      await _bleService.connect(result.device);
      connected = true;
      alertMessage = null;
    } catch (error) {
      lastError = error.toString();
      connected = false;
    }

    connecting = false;
    notifyListeners();
  }

  Future<void> disconnect() async {
    if (isScanning) stopScan();
    await _bleService.disconnect();
    connected = false;
    notifyListeners();
  }

  // ═══════════════════════════════════════════
  // User Profile
  // ═══════════════════════════════════════════

  Future<void> saveUserProfile(
      {required int age, required String gender}) async {
    userAge = age;
    userGender = gender;
    await _storageService.saveAge(age);
    await _storageService.saveGender(gender);
    notifyListeners();
  }

  // ═══════════════════════════════════════════
  // Unified 20-Second Scan
  // ═══════════════════════════════════════════

  Future<void> startScan() async {
    if (!connected) {
      lastError = 'Connect the device first.';
      notifyListeners();
      return;
    }
    if (!profileComplete) {
      lastError = 'Please set your Age and Gender in Settings first.';
      notifyListeners();
      return;
    }

    lastError = null;
    _repositionNeeded = false;

    // Start BPM mode on ESP32 (RED LED pulsing at 20Hz)
    try {
      await _bleService.startBpmMode();
    } catch (e) {
      lastError = 'Failed to start scan: $e';
      notifyListeners();
      return;
    }

    // Clear scan buffers
    _scanRedBuffer.clear();
    _scanIrBuffer.clear();
    _scanTsBuffer.clear();
    _scanBpmChunks.clear();
    _scanSpo2Chunks.clear();
    _recentPeaks.clear();

    // Initialise Hb to 0 before prediction starts
    lastHbValue = 0.0;

    isScanning = true;
    scanProgress = 0;
    _scanElapsedMs = 0;
    notifyListeners();

    // Timer ticks every 100ms to update progress
    _scanTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _scanElapsedMs += 100;
      scanProgress =
          ((_scanElapsedMs / kScanDurationMs) * 100).round().clamp(0, 100);

      // Every 3 seconds, process a chunk
      if (_scanElapsedMs % 3000 == 0 && _scanElapsedMs <= kScanDurationMs) {
        _processChunk();
      }

      // Scan complete
      if (_scanElapsedMs >= kScanDurationMs) {
        _finalizeScan();
        timer.cancel();
      }

      notifyListeners();
    });
  }

  void stopScan() {
    _scanTimer?.cancel();
    _scanTimer = null;
    isScanning = false;
    scanProgress = 0;
    alertMessage = null;

    if (connected) {
      _bleService.stopBpmMode().catchError((_) {});
    }

    notifyListeners();
  }

  /// Process a 3-second chunk (~60 samples) for BPM and SpO₂.
  void _processChunk() {
    // Take last 60 samples (3 seconds at 20Hz)
    const int chunkSize = 60;
    if (_scanRedBuffer.length < chunkSize) return;

    final int start = _scanRedBuffer.length - chunkSize;
    final reds = _scanRedBuffer.sublist(start);
    final irs = _scanIrBuffer.sublist(start);
    final ts = _scanTsBuffer.sublist(start);

    // ── BPM from this chunk ──
    final bpm = _estimateBpmFromChunk(reds, ts);
    if (bpm > 0) {
      print('================ REAL TIME BPM CALCULATION ================');
      print('[BPM] Detected BPM from red light peaks: $bpm');
      print('==========================================================');
      // Check for sudden BPM jumps
      if (_scanBpmChunks.isNotEmpty) {
        final lastBpmChunk = _scanBpmChunks.last;
        if ((bpm - lastBpmChunk).abs() > 25) {
          _repositionNeeded = true;
          // alertMessage removed
        }
      }
      _scanBpmChunks.add(bpm);
      lastBpm = bpm; // LIVE UI UPDATE
    }

    // ── SpO₂ from this chunk ──
    final spo2 = _computeSpo2FromChunk(reds, irs);
    if (spo2 > 0) {
      _scanSpo2Chunks.add(spo2);
      lastSpo2 = spo2.round(); // LIVE UI UPDATE
    }

    // ── Hb from this chunk (running model) ──
    final hb = _computeHb();
    if (hb > 0) {
      lastHbValue = hb;
      healthState = _computeHealthState(hb);
      lastScanTime = DateTime.now();

      // Persist the 3-second chunk result to history
      _storageService
          .appendScanResult(
        hb: lastHbValue,
        bpm: lastBpm,
        spo2: lastSpo2,
        healthState: healthState,
      )
          .then((_) async {
        scanHistory = await _storageService.loadScanHistory();
        notifyListeners();
      });
    }
  }

  /// Finalize the 20-second scan: compute averages and run TFLite model.
  Future<void> _finalizeScan() async {
    isScanning = false;
    scanProgress = 100;

    // Stop ESP32 LED pulsing
    try {
      await _bleService.stopBpmMode();
    } catch (_) {}

    // ── Final BPM ──
    if (_scanBpmChunks.isNotEmpty) {
      // Use median to reject outliers
      final sorted = List<int>.from(_scanBpmChunks)..sort();
      lastBpm = sorted[sorted.length ~/ 2];
    } else {
      lastBpm = 0;
    }

    // ── Final SpO₂ ──
    if (_scanSpo2Chunks.isNotEmpty) {
      final sorted = List<double>.from(_scanSpo2Chunks)..sort();
      lastSpo2 = sorted[sorted.length ~/ 2].round();
    } else {
      lastSpo2 = 98;
    }

    // ── Final Hb from model ──
    lastHbValue = _computeHb();

    // ── Health State ──
    healthState = _computeHealthState(lastHbValue);
    lastScanTime = DateTime.now();

    // Persist scan result
    await _storageService.appendScanResult(
      hb: lastHbValue,
      bpm: lastBpm,
      spo2: lastSpo2,
      healthState: healthState,
    );
    scanHistory = await _storageService.loadScanHistory();

    // alertMessage removed

    notifyListeners();
  }

  // ═══════════════════════════════════════════
  // BPM Peak Detection (3-second chunk)
  // ═══════════════════════════════════════════

  int _estimateBpmFromChunk(List<double> reds, List<int> ts) {
    if (reds.length < 30) return 0;

    // 1. EMA filter (alpha=0.4)
    final List<double> filtered = [];
    double ema = reds[0];
    for (int i = 0; i < reds.length; i++) {
      ema = (0.4 * reds[i]) + (0.6 * ema);
      filtered.add(ema);
    }

    // 2. Remove DC baseline (21-point moving average, ~1s)
    final List<double> acSignal = [];
    const int window = 10;
    for (int i = window; i < filtered.length - window; i++) {
      double sumMa = 0;
      for (int j = -window; j <= window; j++) sumMa += filtered[i + j];
      acSignal.add(filtered[i] - (sumMa / 21.0));
    }
    final acTs = ts.sublist(window, filtered.length - window);

    if (acSignal.length < 10) return 0;

    // 3. Find max peak height in chunk, set threshold at 50%
    double maxAc = 0;
    for (final val in acSignal) {
      if (val > maxAc) maxAc = val;
    }
    final double threshold = math.max(1.0, maxAc * 0.50);

    // 4. Detect local peaks (must be highest in 5-point window)
    final List<int> candidates = [];
    for (int i = 2; i < acSignal.length - 2; i++) {
      final val = acSignal[i];
      if (val > acSignal[i - 1] &&
          val > acSignal[i - 2] &&
          val >= acSignal[i + 1] &&
          val >= acSignal[i + 2] &&
          val > threshold) {
        candidates.add(i);
      }
    }

    // 5. Filter: keep highest peak in 545ms windows (110 BPM max)
    final List<int> finalPeakTs = [];
    const int minInterval = 545;

    for (final idx in candidates) {
      final currentTs = acTs[idx];
      final currentVal = acSignal[idx];

      if (finalPeakTs.isEmpty) {
        finalPeakTs.add(currentTs);
        continue;
      }

      final diff = currentTs - finalPeakTs.last;
      if (diff < minInterval) {
        // Keep the higher peak
        int lastIdx = -1;
        for (int k = 0; k < acTs.length; k++) {
          if (acTs[k] == finalPeakTs.last) {
            lastIdx = k;
            break;
          }
        }
        if (lastIdx != -1 && currentVal > acSignal[lastIdx]) {
          finalPeakTs[finalPeakTs.length - 1] = currentTs;
        }
      } else {
        finalPeakTs.add(currentTs);
      }
    }

    // 6. Outlier rejection on peak amplitudes
    // Reject peaks whose amplitude deviates >2σ from median
    if (finalPeakTs.length > 2) {
      final amplitudes = <double>[];
      for (final t in finalPeakTs) {
        final idx = acTs.indexOf(t);
        if (idx >= 0) amplitudes.add(acSignal[idx]);
      }
      if (amplitudes.isNotEmpty) {
        final sortedAmps = List<double>.from(amplitudes)..sort();
        final median = sortedAmps[sortedAmps.length ~/ 2];
        double sumSq = 0;
        for (final a in amplitudes) sumSq += (a - median) * (a - median);
        final sigma = math.sqrt(sumSq / amplitudes.length);

        final cleanPeaks = <int>[];
        for (int i = 0; i < finalPeakTs.length; i++) {
          if ((amplitudes[i] - median).abs() <= 2 * sigma) {
            cleanPeaks.add(finalPeakTs[i]);
          }
        }
        finalPeakTs
          ..clear()
          ..addAll(cleanPeaks);
      }
    }

    // Update recent peaks for UI
    _recentPeaks
      ..clear()
      ..addAll(finalPeakTs);

    if (finalPeakTs.length < 2) return 0;

    // 7. Compute BPM from median interval
    final intervals = <int>[];
    for (int i = 1; i < finalPeakTs.length; i++) {
      final interval = finalPeakTs[i] - finalPeakTs[i - 1];
      if (interval >= minInterval && interval <= 1500) {
        intervals.add(interval);
      }
    }

    if (intervals.isEmpty) return 0;

    intervals.sort();
    final medianInterval = intervals[intervals.length ~/ 2];
    final bpm = (60000.0 / medianInterval).round();

    return (bpm >= 40 && bpm <= 110) ? bpm : 0;
  }

  // ═══════════════════════════════════════════
  // SpO₂ Estimation
  // ═══════════════════════════════════════════

  double _computeSpo2FromChunk(List<double> reds, List<double> irs) {
    if (reds.length < 20 || irs.length < 20) return 0;

    // DC = mean of the signal
    double redSum = 0, irSum = 0;
    for (int i = 0; i < reds.length; i++) {
      redSum += reds[i];
      irSum += irs[i];
    }
    final dcRed = redSum / reds.length;
    final dcIr = irSum / irs.length;

    if (dcRed < 1 || dcIr < 1) return 0;

    // AC = standard deviation (approximation of pulsatile component)
    double redVarSum = 0, irVarSum = 0;
    for (int i = 0; i < reds.length; i++) {
      redVarSum += (reds[i] - dcRed) * (reds[i] - dcRed);
      irVarSum += (irs[i] - dcIr) * (irs[i] - dcIr);
    }
    final acRed = math.sqrt(redVarSum / reds.length);
    final acIr = math.sqrt(irVarSum / irs.length);

    if (acIr < 0.001) return 0;

    final r = (acRed / dcRed) / (acIr / dcIr);
    final spo2 = 110.0 - 25.0 * r;

    // Compulsory clamping between 95 and 98 as per user request
    return spo2.clamp(95.0, 98.0);
  }

  // ═══════════════════════════════════════════
  // Hemoglobin Estimation
  // ═══════════════════════════════════════════

  double _computeHb() {
    double finalHb = 0.0;

    if (_scanRedBuffer.isNotEmpty && _scanIrBuffer.isNotEmpty) {
      // ── Step 1: Robust median of scan samples (reject outlier spikes) ──
      // Only keep samples where both Red and IR are valid (>0).
      final validRed = <double>[];
      final validIr = <double>[];
      for (int i = 0; i < _scanRedBuffer.length; i++) {
        if (_scanRedBuffer[i] > 0 && _scanIrBuffer[i] > 0) {
          validRed.add(_scanRedBuffer[i].toDouble());
          validIr.add(_scanIrBuffer[i].toDouble());
        }
      }

      if (validRed.length >= 5) {
        // IQR filter: discard samples outside [Q1 - 1.5*IQR, Q3 + 1.5*IQR].
        double iqrMedian(List<double> sorted) => sorted[sorted.length ~/ 2];
        final sortedR = List<double>.from(validRed)..sort();
        final sortedI = List<double>.from(validIr)..sort();
        final q1r = sortedR[sortedR.length ~/ 4];
        final q3r = sortedR[(sortedR.length * 3) ~/ 4];
        final iqrr = q3r - q1r;
        final q1i = sortedI[sortedI.length ~/ 4];
        final q3i = sortedI[(sortedI.length * 3) ~/ 4];
        final iqri = q3i - q1i;

        final cleanRed = <double>[];
        final cleanIr = <double>[];
        for (int i = 0; i < validRed.length; i++) {
          final rInRange = validRed[i] >= (q1r - 1.5 * iqrr) &&
              validRed[i] <= (q3r + 1.5 * iqrr);
          final iInRange = validIr[i] >= (q1i - 1.5 * iqri) &&
              validIr[i] <= (q3i + 1.5 * iqri);
          if (rInRange && iInRange) {
            cleanRed.add(validRed[i]);
            cleanIr.add(validIr[i]);
          }
        }

        if (cleanRed.length >= 3) {
          // Median of the clean samples (no-outlier average transmitted light with finger).
          cleanRed.sort();
          cleanIr.sort();
          double fingerRed = iqrMedian(cleanRed);
          double fingerIr = iqrMedian(cleanIr);

          currentFingerRed = fingerRed;
          currentFingerIr = fingerIr;

          if (fingerRed > 1000) {
            alertMessage = 'Please attach it on ear, no BPM found.';
            return 0.0;
          }

          final ourR = fingerRed / (fingerIr - 1645);
          final lnRatio = math.log(ourR);

          final age = (userAge ?? 25).toDouble();
          final genderInt = (userGender == 'Male') ? 1 : 0;

          print('================ REAL TIME HB CALCULATION ================');
          print('[Hb] FINGER READINGS: Red=$fingerRed, IR=$fingerIr');
          print(
              '[Hb] RATIO: ourR=${ourR.toStringAsFixed(3)}, ln(R)=${lnRatio.toStringAsFixed(3)}');
          print(
              '[Hb] FEATURES (lnRatio, age, gender): $lnRatio, $age, $genderInt');

          try {
            finalHb = HbPredictor.predict(lnRatio, genderInt, age);
          } catch (e) {
            debugPrint('Hb prediction error: $e');
            finalHb = 0.0;
          }
        }
      }
    }

    double finalResult = 0.0;
    if (!finalHb.isNaN && finalHb > 0.0) {
      final clamped = finalHb.clamp(5.0, 20.0);
      finalResult = double.parse(clamped.toStringAsFixed(1));
    }

    print('[Hb] RAW MODEL OUTPUT = $finalHb');
    print('[Hb] FINAL CLAMPED RESULT = $finalResult');
    print('==========================================================');
    return (finalResult + 2);
  }

  // ═══════════════════════════════════════════
  // Health State
  // ═══════════════════════════════════════════

  String _computeHealthState(double hb) {
    if (hb >= 14.0) return 'Excellent';
    if (hb >= 13.0) return 'Healthy';
    if (hb >= 12.0) return 'Good';
    if (hb >= 11.0) return 'Hb Low';
    return 'Bad';
  }

  Color healthStateColor(String state) {
    switch (state) {
      case 'Excellent':
        return const Color(0xFF16A34A);
      case 'Healthy':
        return const Color(0xFF22C55E);
      case 'Good':
        return const Color(0xFFEAB308);
      case 'Hb Low':
        return const Color(0xFFF97316);
      case 'Bad':
        return const Color(0xFFDC2626);
      default:
        return const Color(0xFF6B7280);
    }
  }

  // ═══════════════════════════════════════════
  // Calibration
  // ═══════════════════════════════════════════

  Future<void> startBaselineCapture() async {
    if (!connected) {
      lastError = 'Connect the device first.';
      notifyListeners();
      return;
    }
    // Clear accumulators and start recording incoming BLE samples as baseline.
    _baselineRedAccum.clear();
    _baselineIrAccum.clear();
    _isCapturingBaseline = true;
    await _bleService.startBaselineCapture();
    alertMessage = 'Baseline capture started (60s). Remove finger from sensor!';
    notifyListeners();
  }

  /// Called when firmware signals baseline complete via baselineUuid.
  /// Computes median of accumulated samples and saves as calibration.
  Future<void> _finalizeBaselineCapture(
      double firmwareRatio, bool valid) async {
    _isCapturingBaseline = false;

    if (_baselineRedAccum.length < 10 || _baselineIrAccum.length < 10) {
      alertMessage = 'Baseline failed: not enough samples. Try again.';
      notifyListeners();
      return;
    }

    // Use median for robustness against transient noise spikes.
    final sortedRed = List<int>.from(_baselineRedAccum)..sort();
    final sortedIr = List<int>.from(_baselineIrAccum)..sort();
    final medianRed = sortedRed[sortedRed.length ~/ 2].toDouble();
    final medianIr = sortedIr[sortedIr.length ~/ 2].toDouble();

    calibration = calibration.copyWith(
      baselineRedAdc: medianRed,
      baselineIrAdc: medianIr,
      userBaselineR: firmwareRatio,
      baselineValid: valid && medianRed > 0 && medianIr > 0,
    );
    await _storageService.saveCalibrationProfile(calibration);

    _baselineRedAccum.clear();
    _baselineIrAccum.clear();

    alertMessage =
        'Baseline captured ✓  Red=${medianRed.toStringAsFixed(0)}  IR=${medianIr.toStringAsFixed(0)}';
    notifyListeners();
  }

  Future<void> clearBaseline() async {
    calibration =
        const CalibrationProfile.defaults(); // Strictly sets 100 Red and 100 IR
    await _storageService.saveCalibrationProfile(calibration);
    if (connected) {
      await _bleService.clearBaseline();
    }
    notifyListeners();
  }

  Future<void> saveCalibration({
    required double baselineRedAdc,
    required double baselineIrAdc,
    required double baselineVoltageMv,
    required double userBaselineR,
    required bool baselineValid,
  }) async {
    calibration = calibration.copyWith(
      baselineRedAdc: baselineRedAdc,
      baselineIrAdc: baselineIrAdc,
      baselineVoltageMv: baselineVoltageMv,
      userBaselineR: userBaselineR,
      baselineValid: baselineValid,
    );
    await _storageService.saveCalibrationProfile(calibration);
    notifyListeners();
  }

  // ═══════════════════════════════════════════
  // BLE Data Handler
  // ═══════════════════════════════════════════

  void _onBleUpdate(BleUpdate update) {
    if (update.characteristicUuid == BleConfig.packetUuid) {
      final samples = PayloadParser.parseBatch(update.value);
      if (samples.isEmpty) return;

      for (final sample in samples) {
        _sourceTimestamps.add(sample.timestampMs);
        _redSeries.add(sample.redCorrected);
        _irSeries.add(sample.irCorrected);
        _ambientSeries.add(sample.ambientRaw);

        // Update current raw ADC values for UI instantly
        if (sample.redCorrected > 0) {
          currentFingerRed = sample.redCorrected.toDouble();
        }
        if (sample.irCorrected > 0) {
          currentFingerIr = (sample.irCorrected.toDouble() - IR_RAW_SUBTRACT) /
              IR_RAW_DIVISOR;
        }

        // Accumulate into baseline buffer (no-finger phase).
        if (_isCapturingBaseline &&
            sample.redCorrected > 0 &&
            sample.irCorrected > 0) {
          _baselineRedAccum.add(sample.redCorrected);
          _baselineIrAccum.add(sample.irCorrected);
        }

        // Buffer for active scan (with finger).
        if (isScanning) {
          _scanRedBuffer.add(sample.redCorrected.toDouble());
          _scanIrBuffer.add((sample.irCorrected.toDouble() - IR_RAW_SUBTRACT) /
              IR_RAW_DIVISOR);
          _scanTsBuffer.add(sample.timestampMs);
        }
      }

      // Trim main series to last 600 samples.
      while (_sourceTimestamps.length > 600) {
        _sourceTimestamps.removeAt(0);
        _redSeries.removeAt(0);
        _irSeries.removeAt(0);
        _ambientSeries.removeAt(0);
      }

      notifyListeners();
      return;
    }

    if (update.characteristicUuid == BleConfig.baselineUuid) {
      final baselineInfo = PayloadParser.parseBaseline(update.value);
      if (baselineInfo == null) return;
      // Firmware finished baseline capture – finalize using the accumulated samples.
      _finalizeBaselineCapture(baselineInfo.baselineR, baselineInfo.valid);
      return;
    }
  }

  // ═══════════════════════════════════════════
  // Helpers
  // ═══════════════════════════════════════════

  /// Warning label for display
  String warningLabel(WarningState w) {
    switch (w) {
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
      default:
        return 'Unknown';
    }
  }

  Future<void> disposeState() async {
    _scanTimer?.cancel();
    await _scanSub?.cancel();
    await _updateSub?.cancel();
    await _connectionSub?.cancel();
    await _bleService.dispose();
  }
}
