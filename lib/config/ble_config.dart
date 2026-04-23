import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleConfig {
  static const String deviceNamePrefix = 'HemePulse';

  static final Guid serviceUuid =
      Guid('4f9c0100-a1f2-4c31-98cb-1cce5caa1000');
  static final Guid liveStatusUuid =
      Guid('4f9c0101-a1f2-4c31-98cb-1cce5caa1001');
  static final Guid bpmUuid =
      Guid('4f9c0102-a1f2-4c31-98cb-1cce5caa1002');
  static final Guid ratioUuid =
      Guid('4f9c0103-a1f2-4c31-98cb-1cce5caa1003');
  static final Guid confidenceUuid =
      Guid('4f9c0104-a1f2-4c31-98cb-1cce5caa1004');
  static final Guid warningUuid =
      Guid('4f9c0105-a1f2-4c31-98cb-1cce5caa1005');
  static final Guid waveformUuid =
      Guid('4f9c0106-a1f2-4c31-98cb-1cce5caa1006');
  static final Guid controlUuid =
      Guid('4f9c0107-a1f2-4c31-98cb-1cce5caa1007');
  static final Guid baselineUuid =
      Guid('4f9c0108-a1f2-4c31-98cb-1cce5caa1008');
  static final Guid packetUuid =
      Guid('4f9c0109-a1f2-4c31-98cb-1cce5caa1009');
}
