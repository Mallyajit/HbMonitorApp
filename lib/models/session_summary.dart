import 'vital_snapshot.dart';

class SessionSummary {
  final DateTime timestamp;
  final double avgRed;
  final double avgIr;
  final double ratioR;
  final int bpm;
  final int confidence;
  final WarningState warning;
  final bool motionLikely;

  const SessionSummary({
    required this.timestamp,
    required this.avgRed,
    required this.avgIr,
    required this.ratioR,
    required this.bpm,
    required this.confidence,
    required this.warning,
    required this.motionLikely,
  });

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'avgRed': avgRed,
      'avgIr': avgIr,
      'ratioR': ratioR,
      'bpm': bpm,
      'confidence': confidence,
      'warning': warning.index,
      'motionLikely': motionLikely,
    };
  }

  factory SessionSummary.fromMap(Map<String, dynamic> map) {
    final warningIndex = (map['warning'] as num?)?.toInt() ?? WarningState.unknown.index;
    final warning = (warningIndex >= 0 && warningIndex < WarningState.values.length)
        ? WarningState.values[warningIndex]
        : WarningState.unknown;

    return SessionSummary(
      timestamp: DateTime.tryParse((map['timestamp'] ?? '').toString()) ?? DateTime.now(),
      avgRed: (map['avgRed'] ?? 0).toDouble(),
      avgIr: (map['avgIr'] ?? 0).toDouble(),
      ratioR: (map['ratioR'] ?? 0).toDouble(),
      bpm: (map['bpm'] as num?)?.toInt() ?? 0,
      confidence: (map['confidence'] as num?)?.toInt() ?? 0,
      warning: warning,
      motionLikely: (map['motionLikely'] ?? false) as bool,
    );
  }
}
