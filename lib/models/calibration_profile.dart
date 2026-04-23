class CalibrationProfile {
  final double photodiodeSensitivityAw;
  final double amplifierGainVPerA;
  final double baselineVoltageMv;
  final double userBaselineR;
  final bool baselineValid;

  const CalibrationProfile({
    required this.photodiodeSensitivityAw,
    required this.amplifierGainVPerA,
    required this.baselineVoltageMv,
    required this.userBaselineR,
    required this.baselineValid,
  });

  const CalibrationProfile.defaults()
      : photodiodeSensitivityAw = 0,
        amplifierGainVPerA = 0,
        baselineVoltageMv = 1200,
        userBaselineR = 0,
        baselineValid = false;

  CalibrationProfile copyWith({
    double? photodiodeSensitivityAw,
    double? amplifierGainVPerA,
    double? baselineVoltageMv,
    double? userBaselineR,
    bool? baselineValid,
  }) {
    return CalibrationProfile(
      photodiodeSensitivityAw:
          photodiodeSensitivityAw ?? this.photodiodeSensitivityAw,
      amplifierGainVPerA: amplifierGainVPerA ?? this.amplifierGainVPerA,
      baselineVoltageMv: baselineVoltageMv ?? this.baselineVoltageMv,
      userBaselineR: userBaselineR ?? this.userBaselineR,
      baselineValid: baselineValid ?? this.baselineValid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'photodiodeSensitivityAw': photodiodeSensitivityAw,
      'amplifierGainVPerA': amplifierGainVPerA,
      'baselineVoltageMv': baselineVoltageMv,
      'userBaselineR': userBaselineR,
      'baselineValid': baselineValid,
    };
  }

  factory CalibrationProfile.fromMap(Map<String, dynamic> map) {
    return CalibrationProfile(
      photodiodeSensitivityAw: (map['photodiodeSensitivityAw'] ?? 0).toDouble(),
      amplifierGainVPerA: (map['amplifierGainVPerA'] ?? 0).toDouble(),
      baselineVoltageMv: (map['baselineVoltageMv'] ?? 1200).toDouble(),
      userBaselineR: (map['userBaselineR'] ?? 0).toDouble(),
      baselineValid: (map['baselineValid'] ?? false) as bool,
    );
  }
}
