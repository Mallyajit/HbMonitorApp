import 'dart:typed_data';

import '../models/vital_snapshot.dart';

class SensorPacket {
  final int timestampMs;
  final int ambientRaw;
  final int redCorrected;
  final int irCorrected;
  final double ratioR;
  final int confidence;
  final WarningState warning;
  final int flags;

  const SensorPacket({
    required this.timestampMs,
    required this.ambientRaw,
    required this.redCorrected,
    required this.irCorrected,
    required this.ratioR,
    required this.confidence,
    required this.warning,
    required this.flags,
  });
}

class PayloadParser {
  static SensorPacket? parseSensorPacket(List<int> bytes) {
    if (bytes.length < 17) {
      return null;
    }

    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    final warningValue = data.getUint8(15);

    return SensorPacket(
      timestampMs: data.getUint32(0, Endian.little),
      ambientRaw: data.getInt16(4, Endian.little),
      redCorrected: data.getInt16(6, Endian.little),
      irCorrected: data.getInt16(8, Endian.little),
      ratioR: data.getFloat32(10, Endian.little).toDouble(),
      confidence: data.getUint8(14),
      warning: parseWarning(<int>[warningValue]),
      flags: data.getUint8(16),
    );
  }

  static int parseUint16Le(List<int> bytes) {
    if (bytes.length < 2) {
      return 0;
    }
    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    return data.getUint16(0, Endian.little);
  }

  static int parseInt16Le(List<int> bytes) {
    if (bytes.length < 2) {
      return 0;
    }
    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    return data.getInt16(0, Endian.little);
  }

  static double parseFloat32Le(List<int> bytes) {
    if (bytes.length < 4) {
      return 0;
    }
    final data = ByteData.sublistView(Uint8List.fromList(bytes));
    return data.getFloat32(0, Endian.little).toDouble();
  }

  static int parseU8(List<int> bytes) {
    if (bytes.isEmpty) {
      return 0;
    }
    return bytes.first;
  }

  static WarningState parseWarning(List<int> bytes) {
    if (bytes.isEmpty) {
      return WarningState.unknown;
    }

    switch (bytes.first) {
      case 0:
        return WarningState.normal;
      case 1:
        return WarningState.elevated;
      case 2:
        return WarningState.high;
      case 3:
        return WarningState.lowSignal;
      case 4:
        return WarningState.baselineNeeded;
      default:
        return WarningState.unknown;
    }
  }
}
