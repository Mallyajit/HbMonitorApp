import 'package:flutter/material.dart';

import '../../state/app_state.dart';

class PulseCheckScreen extends StatelessWidget {
  final HemePulseAppState state;

  const PulseCheckScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final bpm = state.latest.bpm;
    final isPulseActive = state.pulseCheckActive;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pulse Check Mode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              'Flashes the RED LED and measures your pulse rate from the corrected signal. '
              'Keep your finger/ear-lobe still during measurement.',
            ),
            const SizedBox(height: 16),
            // BPM display
            if (isPulseActive) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      bpm > 0 ? '$bpm' : '--',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: bpm > 0
                            ? const Color(0xFFD32F2F)
                            : Colors.grey,
                      ),
                    ),
                    Text(
                      'BPM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bpm > 0
                          ? 'Pulse detected'
                          : 'Detecting pulse... keep still',
                      style: TextStyle(
                        color: bpm > 0
                            ? const Color(0xFF2E7D32)
                            : Colors.orange.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Action button
            Center(
              child: isPulseActive
                  ? FilledButton.tonalIcon(
                      onPressed: state.connected
                          ? state.stopPulseCheck
                          : null,
                      icon: const Icon(Icons.stop),
                      label: const Text('Stop Pulse Check'),
                    )
                  : FilledButton.icon(
                      onPressed: state.connected
                          ? state.startPulseCheck
                          : null,
                      icon: const Icon(Icons.favorite),
                      label: const Text('Check Pulse'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
