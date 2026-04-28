class CalibrationProfile {
  /// Baseline Red ADC count (no finger, ambient-subtracted). Used to compute absorption.
  final double baselineRedAdc;

  /// Baseline IR ADC count (no finger, ambient-subtracted). Used to compute absorption.
  final double baselineIrAdc;

  /// Voltage reference for the ADC (mV). Used for scaling.
  final double baselineVoltageMv;

  /// Raw R-ratio stored from firmware baseline capture (for backward compat).
  final double userBaselineR;

  /// Whether the baseline has been captured and is valid.
  final bool baselineValid;

  const CalibrationProfile({
    required this.baselineRedAdc,
    required this.baselineIrAdc,
    required this.baselineVoltageMv,
    required this.userBaselineR,
    required this.baselineValid,
  });

  const CalibrationProfile.defaults()
      : baselineRedAdc = 100,
        baselineIrAdc = 100,
        baselineVoltageMv = 1200,
        userBaselineR = 0,
        baselineValid = false;

  CalibrationProfile copyWith({
    double? baselineRedAdc,
    double? baselineIrAdc,
    double? baselineVoltageMv,
    double? userBaselineR,
    bool? baselineValid,
  }) {
    return CalibrationProfile(
      baselineRedAdc: baselineRedAdc ?? this.baselineRedAdc,
      baselineIrAdc: baselineIrAdc ?? this.baselineIrAdc,
      baselineVoltageMv: baselineVoltageMv ?? this.baselineVoltageMv,
      userBaselineR: userBaselineR ?? this.userBaselineR,
      baselineValid: baselineValid ?? this.baselineValid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'baselineRedAdc': baselineRedAdc,
      'baselineIrAdc': baselineIrAdc,
      'baselineVoltageMv': baselineVoltageMv,
      'userBaselineR': userBaselineR,
      'baselineValid': baselineValid,
    };
  }

  factory CalibrationProfile.fromMap(Map<String, dynamic> map) {
    return CalibrationProfile(
      // Handle legacy keys (photodiodeSensitivityAw stored as baselineRedAdc)
      baselineRedAdc: (map['baselineRedAdc'] ?? map['photodiodeSensitivityAw'] ?? 0).toDouble(),
      baselineIrAdc: (map['baselineIrAdc'] ?? map['amplifierGainVPerA'] ?? 0).toDouble(),
      baselineVoltageMv: (map['baselineVoltageMv'] ?? 1200).toDouble(),
      userBaselineR: (map['userBaselineR'] ?? 0).toDouble(),
      baselineValid: (map['baselineValid'] ?? false) as bool,
    );
  }
}
