import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/session_summary.dart';
import '../../models/vital_snapshot.dart';
import '../../state/app_state.dart';
import '../widgets/trend_chart.dart';
import 'hemoglobin_status_screen.dart';
import 'pulse_check_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HemePulseAppState>(
      builder: (context, state, child) {
        final snapshot = state.latest;
        final warningText = state.warningLabel(snapshot.warning);

        return Scaffold(
          appBar: AppBar(title: const Text('HemePulse Dashboard')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (state.alertMessage != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0E6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD46A1C)),
                  ),
                  child: Text(
                    state.alertMessage!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _MetricCard(label: 'BPM', value: snapshot.bpm.toString()),
                  _MetricCard(label: 'R Value', value: snapshot.ratioR.toStringAsFixed(4)),
                  _MetricCard(label: 'Confidence', value: '${snapshot.confidence}%'),
                  _MetricCard(label: 'Warning', value: warningText),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Monitoring Modes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('BPM Check'),
                      selected: state.mode == AppMode.pulseCheck,
                      onSelected: (_) => state.setMode(AppMode.pulseCheck),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ChoiceChip(
                      label: const Text('Hemoglobin Status'),
                      selected: state.mode == AppMode.hemoglobinStatus,
                      onSelected: (_) => state.setMode(AppMode.hemoglobinStatus),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (state.mode == AppMode.pulseCheck)
                PulseCheckScreen(state: state)
              else
                HemoglobinStatusScreen(state: state),
              const SizedBox(height: 16),
              const Text(
                'IR Waveform Trend',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 190,
                child: TrendChart(data: state.trend),
              ),
              const SizedBox(height: 16),
              _SessionTrendCard(state: state),
              const SizedBox(height: 12),
              _SignalDetails(snapshot: snapshot),
            ],
          ),
        );
      },
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;

  const _MetricCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCCD8E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _SignalDetails extends StatelessWidget {
  final VitalSnapshot snapshot;

  const _SignalDetails({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Signal Details',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text('Beat detected: ${snapshot.beatDetected ? 'Yes' : 'No'}'),
            Text('Baseline available: ${snapshot.baselineAvailable ? 'Yes' : 'No'}'),
            Text('Baseline capture active: ${snapshot.baselineCapturing ? 'Yes' : 'No'}'),
            Text('Motion likely: ${snapshot.motionLikely ? 'Yes' : 'No'}'),
            Text('Ambient raw: ${snapshot.ambientRaw}'),
            Text('Red corrected: ${snapshot.redRaw}'),
            Text('IR corrected: ${snapshot.irRaw}'),
          ],
        ),
      ),
    );
  }
}

class _SessionTrendCard extends StatelessWidget {
  final HemePulseAppState state;

  const _SessionTrendCard({required this.state});

  @override
  Widget build(BuildContext context) {
    final List<SessionSummary> recent = state.sessionHistory.reversed.take(3).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Session Trend Comparison',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text('Saved sessions: ${state.sessionHistory.length}'),
            const SizedBox(height: 10),
            if (recent.isEmpty)
              const Text('No completed sessions yet. Disconnect once after a reading session to save one.')
            else
              Column(
                children: recent
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                '${item.timestamp.hour.toString().padLeft(2, '0')}:${item.timestamp.minute.toString().padLeft(2, '0')}',
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text('R ${item.ratioR.toStringAsFixed(4)}'),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('BPM ${item.bpm}'),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('${item.confidence}%'),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}
