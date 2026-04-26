import 'package:shared_preferences/shared_preferences.dart';
import '../models/calibration_profile.dart';
import '../models/session_summary.dart';

class StorageService {
  // ── Calibration Profile ──
  Future<CalibrationProfile> loadCalibrationProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return CalibrationProfile(
      baselineRedAdc: prefs.getDouble('baseline_red_adc') ?? 300,
      baselineIrAdc: prefs.getDouble('baseline_ir_adc') ?? 700,
      baselineVoltageMv: prefs.getDouble('baseline_v') ?? 1200,
      userBaselineR: prefs.getDouble('user_baseline_r') ?? 0,
      baselineValid: prefs.getBool('baseline_valid') ?? true, // Set to true to allow computation without manual capture
    );
  }

  Future<void> saveCalibrationProfile(CalibrationProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('baseline_red_adc', profile.baselineRedAdc);
    await prefs.setDouble('baseline_ir_adc', profile.baselineIrAdc);
    await prefs.setDouble('baseline_v', profile.baselineVoltageMv);
    await prefs.setDouble('user_baseline_r', profile.userBaselineR);
    await prefs.setBool('baseline_valid', profile.baselineValid);
  }

  // ── Session History ──
  Future<List<SessionSummary>> loadSessionHistory() async {
    // Placeholder – session history is kept in memory for now.
    return <SessionSummary>[];
  }

  Future<void> saveSessionHistory(List<SessionSummary> sessions) async {
    // Placeholder – extend if persistence is needed
  }

  // ── User Profile (age & gender) ──
  Future<int?> loadAge() async {
    final prefs = await SharedPreferences.getInstance();
    final age = prefs.getInt('user_age');
    return age;
  }

  Future<void> saveAge(int age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_age', age);
  }

  Future<String?> loadGender() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_gender');
  }

  Future<void> saveGender(String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_gender', gender);
  }

  // ── Device Baseline (no-finger calibration offsets) ──
  Future<({double redOffset, double irOffset})?> loadDeviceBaseline() async {
    final prefs = await SharedPreferences.getInstance();
    final red = prefs.getDouble('device_baseline_red');
    final ir = prefs.getDouble('device_baseline_ir');
    if (red == null || ir == null) return null;
    return (redOffset: red, irOffset: ir);
  }

  Future<void> saveDeviceBaseline(double redOffset, double irOffset) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('device_baseline_red', redOffset);
    await prefs.setDouble('device_baseline_ir', irOffset);
  }

  // ── Scan History (Hb, BPM, SpO2 per scan) ──
  Future<List<Map<String, dynamic>>> loadScanHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('scan_count') ?? 0;
    final results = <Map<String, dynamic>>[];
    for (int i = 0; i < count; i++) {
      results.add({
        'hb': prefs.getDouble('scan_${i}_hb') ?? 0.0,
        'bpm': prefs.getInt('scan_${i}_bpm') ?? 0,
        'spo2': prefs.getInt('scan_${i}_spo2') ?? 0,
        'timestamp': prefs.getString('scan_${i}_ts') ?? '',
        'healthState': prefs.getString('scan_${i}_hs') ?? 'Unknown',
      });
    }
    return results;
  }

  Future<void> appendScanResult({
    required double hb,
    required int bpm,
    required int spo2,
    required String healthState,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('scan_count') ?? 0;
    await prefs.setDouble('scan_${count}_hb', hb);
    await prefs.setInt('scan_${count}_bpm', bpm);
    await prefs.setInt('scan_${count}_spo2', spo2);
    await prefs.setString('scan_${count}_ts', DateTime.now().toIso8601String());
    await prefs.setString('scan_${count}_hs', healthState);
    await prefs.setInt('scan_count', count + 1);
  }
}
