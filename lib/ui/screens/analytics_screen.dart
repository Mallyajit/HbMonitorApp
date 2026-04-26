import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

/// Analytics screen matching AnalyticsScreen.tsx + old dashboard data.
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HemePulseAppState>(
      builder: (context, state, _) {
        final history = state.scanHistory;
        final totalScans = history.length;

        // Compute stats
        double avgHb = 13.0;
        double highHb = 0;
        double lowHb = 99;
        int daysNormal = 0;

        if (history.isNotEmpty) {
          double sum = 0;
          for (final scan in history) {
            final hb = (scan['hb'] as double?) ?? 13.0;
            sum += hb;
            if (hb > highHb) highHb = hb;
            if (hb < lowHb) lowHb = hb;
            if (hb >= 12.0 && hb <= 16.0) daysNormal++;
          }
          avgHb = sum / history.length;
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Analytics',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Stats Cards
                Row(
                  children: [
                    _StatCard(
                      icon: Icons.trending_up,
                      iconColor: const Color(0xFF22C55E),
                      value: avgHb.toStringAsFixed(1),
                      label: 'Avg Hb',
                    ),
                    const SizedBox(width: 10),
                    _StatCard(
                      icon: Icons.show_chart,
                      iconColor: const Color(0xFF3B82F6),
                      value: '$totalScans',
                      label: 'Total Scans',
                    ),
                    const SizedBox(width: 10),
                    _StatCard(
                      icon: Icons.calendar_today,
                      iconColor: const Color(0xFF8B5CF6),
                      value: '$daysNormal',
                      label: 'Normal Scans',
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Health Summary
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Health Summary',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(height: 12),
                      _SummaryRow('Total Scans', '$totalScans'),
                      if (history.isNotEmpty) ...[
                        _SummaryRow('Highest Reading', '${highHb.toStringAsFixed(1)} g/dL'),
                        _SummaryRow('Lowest Reading', '${lowHb.toStringAsFixed(1)} g/dL'),
                        _SummaryRow('Scans in Normal Range', '$daysNormal / $totalScans'),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Recent Scans
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent Scans',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(height: 12),
                      if (history.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'No scans recorded yet.',
                              style: TextStyle(color: Color(0xFF9CA3AF)),
                            ),
                          ),
                        ),
                      ...history.reversed.take(10).map((scan) {
                        final hb = (scan['hb'] as double?) ?? 0;
                        final bpm = (scan['bpm'] as int?) ?? 0;
                        final spo2 = (scan['spo2'] as int?) ?? 0;
                        final hs = (scan['healthState'] as String?) ?? '';
                        final tsStr = (scan['timestamp'] as String?) ?? '';
                        DateTime? dt;
                        try { dt = DateTime.parse(tsStr); } catch (_) {}

                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hb: ${hb.toStringAsFixed(1)} g/dL',
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                    ),
                                    Text(
                                      'BPM: $bpm | SpO₂: $spo2%',
                                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    hs,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: _stateColor(hs),
                                    ),
                                  ),
                                  if (dt != null)
                                    Text(
                                      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}',
                                      style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _stateColor(String state) {
    switch (state) {
      case 'Excellent': return const Color(0xFF16A34A);
      case 'Healthy': return const Color(0xFF22C55E);
      case 'Good': return const Color(0xFFEAB308);
      case 'Hb Low': return const Color(0xFFF97316);
      case 'Bad': return const Color(0xFFDC2626);
      default: return const Color(0xFF6B7280);
    }
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
