import 'dart:typed_data';

import '../models/vital_snapshot.dart';

/// Raw sample from ESP32 (11 bytes each).
class RawSample {
  final int timestampMs;
  final int ambientRaw;
  final int redCorrected;
  final int irCorrected;
  final int mode;  // 0=idle, 1=hbBurst, 2=pulse

  const RawSample({
    required this.timestampMs,
    required this.ambientRaw,
    required this.redCorrected,
    required this.irCorrected,
    required this.mode,
  });

  bool get isPulseMode => mode == 2;
  bool get isHbMode => mode == 1;
}

class PayloadParser {
  static const int kRawSampleSize = 11;

  /// Parse a batch BLE notification into a list of raw samples.
  /// The firmware sends 1–5 samples per notification, each 11 bytes.
  static List<RawSample> parseBatch(List<int> bytes) {
    if (bytes.length < kRawSampleSize) {
      return [];
    }

    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    final sampleCount = bytes.length ~/ kRawSampleSize;
    final results = <RawSample>[];

    for (int i = 0; i < sampleCount; i++) {
      final offset = i * kRawSampleSize;
      if (offset + kRawSampleSize > bytes.length) break;

      results.add(RawSample(
        timestampMs: data.getUint32(offset, Endian.little),
        ambientRaw: data.getInt16(offset + 4, Endian.little),
        redCorrected: data.getInt16(offset + 6, Endian.little),
        irCorrected: data.getInt16(offset + 8, Endian.little),
        mode: data.getUint8(offset + 10),
      ));
    }

    return results;
  }

  /// Parse baseline notification (5 bytes: float32 + uint8 flag).
  static ({double baselineR, bool valid})? parseBaseline(List<int> bytes) {
    if (bytes.length < 5) return null;
    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    return (
      baselineR: data.getFloat32(0, Endian.little).toDouble(),
      valid: bytes[4] == 1,
    );
  }

  // Legacy helpers kept for backward compatibility
  static WarningState parseWarning(List<int> bytes) {
    if (bytes.isEmpty) return WarningState.unknown;
    switch (bytes.first) {
      case 0: return WarningState.normal;
      case 1: return WarningState.elevated;
      case 2: return WarningState.high;
      case 3: return WarningState.lowSignal;
      case 4: return WarningState.baselineNeeded;
      default: return WarningState.unknown;
    }
  }
}
