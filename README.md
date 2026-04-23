# hb_monitor_app

Flutter companion app for the HemePulse ESP32-C3 firmware.

## Features
- BLE scanning and connection to `HemePulse-C3`
- Live dashboard: app-calculated BPM, ratio R, confidence, warning state, waveform trend
- Pulse Check mode for live heartbeat measurement from RED-only sampling
- Hemoglobin Status mode for trend-based warning review
- Session history comparison for repeated drift detection
- Calibration page with placeholder hardware parameters and baseline override

## BLE Contract
The app expects these custom UUIDs:
- Service: `4f9c0100-a1f2-4c31-98cb-1cce5caa1000`
- Control (write): `4f9c0107-a1f2-4c31-98cb-1cce5caa1007`
- Baseline state: `4f9c0108-a1f2-4c31-98cb-1cce5caa1008`
- Sensor packet (notify): `4f9c0109-a1f2-4c31-98cb-1cce5caa1009`

Sensor packet payload (little-endian, 17 bytes):
- `uint32 timestampMs`
- `int16 ambientRaw`
- `int16 redCorrected`
- `int16 irCorrected`
- `float32 ratioR`
- `uint8 confidence`
- `uint8 warning`
- `uint8 flags`

## Control Commands
Write UTF-8 command strings to the Control characteristic:
- `SNAP`
- `BASE_START`
- `BASE_CLEAR`
- `BASE_SET=<float>`
- `CAL_PD=<float>`
- `CAL_GAIN=<float>`
- `CAL_VREF=<float>`
- `BPM_START`
- `BPM_STOP`
- `MODE_PULSE`
- `MODE_IDLE`

Pulse mode behavior:
- Firmware switches to RED-only acquisition for heartbeat checks.
- RED LED is flashed continuously until app sends stop command (or BLE disconnects).
- BPM is estimated in app from corrected RED signal drops.

## Run
1. `flutter pub get`
2. `flutter run`

## Notes
The app computes BPM and trend confidence from incoming red/IR pulse data and does not compute absolute hemoglobin concentration.
