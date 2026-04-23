import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/calibration_profile.dart';
import '../models/session_summary.dart';

class StorageService {
  static const String _calibrationKey = 'calibration_profile';
  static const String _sessionHistoryKey = 'session_history';

  Future<CalibrationProfile> loadCalibrationProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_calibrationKey);
    if (raw == null || raw.isEmpty) {
      return const CalibrationProfile.defaults();
    }

    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      return CalibrationProfile.fromMap(decoded);
    } catch (_) {
      return const CalibrationProfile.defaults();
    }
  }

  Future<void> saveCalibrationProfile(CalibrationProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(profile.toMap());
    await prefs.setString(_calibrationKey, encoded);
  }

  Future<List<SessionSummary>> loadSessionHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_sessionHistoryKey);
    if (raw == null || raw.isEmpty) {
      return <SessionSummary>[];
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) {
        return <SessionSummary>[];
      }

      return decoded
          .whereType<Map<String, dynamic>>()
          .map(SessionSummary.fromMap)
          .toList();
    } catch (_) {
      return <SessionSummary>[];
    }
  }

  Future<void> saveSessionHistory(List<SessionSummary> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(sessions.map((item) => item.toMap()).toList());
    await prefs.setString(_sessionHistoryKey, encoded);
  }
}
