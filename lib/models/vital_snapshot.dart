enum WarningState {
  normal,
  elevated,
  high,
  lowSignal,
  baselineNeeded,
  unknown,
}

class VitalSnapshot {
  final DateTime timestamp;
  final int sourceTimestampMs;
  final int bpm;
  final double ratioR;
  final int confidence;
  final WarningState warning;
  final int ambientRaw;
  final int redRaw;
  final int irRaw;
  final bool motionLikely;
  final int flags;

  const VitalSnapshot({
    required this.timestamp,
    required this.sourceTimestampMs,
    required this.bpm,
    required this.ratioR,
    required this.confidence,
    required this.warning,
    required this.ambientRaw,
    required this.redRaw,
    required this.irRaw,
    required this.motionLikely,
    required this.flags,
  });

  VitalSnapshot.empty()
      : timestamp = DateTime.fromMillisecondsSinceEpoch(0),
        sourceTimestampMs = 0,
        bpm = 0,
        ratioR = 0,
        confidence = 0,
        warning = WarningState.baselineNeeded,
        ambientRaw = 0,
        redRaw = 0,
        irRaw = 0,
        motionLikely = false,
        flags = 0;

  int get irWave => irRaw;

  bool get hasSignal => confidence > 0;

  bool get hasRisk => warning == WarningState.elevated || warning == WarningState.high;

  bool get beatDetected => (flags & 0x01) != 0;

  bool get baselineAvailable => (flags & 0x10) != 0;

  bool get baselineCapturing => (flags & 0x20) != 0;

  VitalSnapshot copyWith({
    DateTime? timestamp,
    int? sourceTimestampMs,
    int? bpm,
    double? ratioR,
    int? confidence,
    WarningState? warning,
    int? ambientRaw,
    int? redRaw,
    int? irRaw,
    bool? motionLikely,
    int? flags,
  }) {
    return VitalSnapshot(
      timestamp: timestamp ?? this.timestamp,
      sourceTimestampMs: sourceTimestampMs ?? this.sourceTimestampMs,
      bpm: bpm ?? this.bpm,
      ratioR: ratioR ?? this.ratioR,
      confidence: confidence ?? this.confidence,
      warning: warning ?? this.warning,
      ambientRaw: ambientRaw ?? this.ambientRaw,
      redRaw: redRaw ?? this.redRaw,
      irRaw: irRaw ?? this.irRaw,
      motionLikely: motionLikely ?? this.motionLikely,
      flags: flags ?? this.flags,
    );
  }
}
