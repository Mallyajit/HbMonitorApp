import 'package:flutter/material.dart';

import '../../state/app_state.dart';

class HemoglobinStatusScreen extends StatelessWidget {
  final HemePulseAppState state;

  const HemoglobinStatusScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final hasBaseline =
        state.calibration.baselineValid && state.calibration.userBaselineR > 0;
    final hbStatus = state.hbStatusLabel;
    final hbColor = state.hbStatusColor;
    final hbConfidence = state.hbStatusConfidence;
    final testCount = state.hbTestCount;
    final recentSessions = state.sessionHistory.reversed.take(5).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hemoglobin Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              'This mode uses both RED and IR LEDs to estimate relative hemoglobin trends. '
              'Capture a baseline first, then monitor changes over multiple sessions.',
            ),
            const SizedBox(height: 12),
            // Baseline controls
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed:
                      state.connected ? state.startBaselineCapture : null,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start Baseline Capture'),
                ),
                OutlinedButton.icon(
                  onPressed: state.connected ? state.requestSnapshot : null,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Request Snapshot'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Status display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: hbColor.withAlpha(25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: hbColor.withAlpha(100)),
              ),
              child: Column(
                children: [
                  Text(
                    hbStatus,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: hbColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hasBaseline
                        ? 'Based on $testCount test${testCount == 1 ? '' : 's'} '
                            '(needs ${testCount < 4 ? '${4 - testCount} more' : 'sufficient'})'
                        : 'Set a baseline to begin monitoring',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                  if (hasBaseline && testCount >= 4) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Confidence: ${hbConfidence.toStringAsFixed(0)}%',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Baseline info
            Text(
              'Baseline R: ${hasBaseline ? state.calibration.userBaselineR.toStringAsFixed(4) : 'Not set'}',
            ),
            Text(
              'Current R: ${state.latest.ratioR.toStringAsFixed(4)}',
            ),
            if (hasBaseline)
              Text(
                'Drift: ${((state.latest.ratioR - state.calibration.userBaselineR) / state.calibration.userBaselineR * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ((state.latest.ratioR -
                                      state.calibration.userBaselineR) /
                                  state.calibration.userBaselineR)
                              .abs() >
                          0.07
                      ? Colors.deepOrange
                      : Colors.black87,
                ),
              ),
            const SizedBox(height: 12),
            const Text(
              'Recent Tests',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            if (recentSessions.isEmpty)
              const Text('No saved sessions yet.')
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recentSessions
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '${item.timestamp.hour.toString().padLeft(2, '0')}:'
                          '${item.timestamp.minute.toString().padLeft(2, '0')} | '
                          'R ${item.ratioR.toStringAsFixed(4)} | '
                          '${item.confidence}% conf',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(height: 8),
            const Text(
              'Note: This is a relative trend indicator, not an absolute hemoglobin measurement.',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
