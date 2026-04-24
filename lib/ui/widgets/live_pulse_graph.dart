import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../state/app_state.dart';

class LivePulseGraph extends StatelessWidget {
  final HemePulseAppState state;

  const LivePulseGraph({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: state,
      builder: (context, _) {
        if (!state.pulseCheckActive || state.redSeries.isEmpty) {
          return const Center(
            child: Text(
              'Graph will appear when BPM Check starts...',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return CustomPaint(
          size: const Size(double.infinity, 200),
          painter: _PulseGraphPainter(
            redSeries: state.redSeries,
            timestamps: state.sourceTimestamps,
            valleys: state.recentValleys,
          ),
        );
      },
    );
  }
}

class _PulseGraphPainter extends CustomPainter {
  final List<int> redSeries;
  final List<int> timestamps;
  final List<int> valleys;

  _PulseGraphPainter({
    required this.redSeries,
    required this.timestamps,
    required this.valleys,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (redSeries.length < 2) return;

    // Display the last 150 points (~7.5 seconds of data at 20Hz)
    const int maxVisiblePoints = 150;
    final int startIdx = math.max(0, redSeries.length - maxVisiblePoints);
    
    final List<int> visibleRed = redSeries.sublist(startIdx);
    final List<int> visibleTs = timestamps.sublist(startIdx);

    // Find min and max for auto-scaling
    int minVal = visibleRed[0];
    int maxVal = visibleRed[0];
    for (int v in visibleRed) {
      if (v < minVal) minVal = v;
      if (v > maxVal) maxVal = v;
    }

    // Add a tiny bit of padding to min/max
    final double range = math.max(10.0, (maxVal - minVal).toDouble());
    final double paddedMin = minVal - (range * 0.1);
    final double paddedMax = maxVal + (range * 0.1);
    final double paddedRange = paddedMax - paddedMin;

    final Paint linePaint = Paint()
      ..color = Colors.blue.shade700
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Paint dotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final Path path = Path();
    
    final double stepX = size.width / (maxVisiblePoints - 1);
    
    // Convert valleys to a quick lookup set for the current window
    final Set<int> valleySet = valleys.toSet();

    for (int i = 0; i < visibleRed.length; i++) {
      // Points align to the right, so recent data is on the right side
      final double x = size.width - ((visibleRed.length - 1 - i) * stepX);
      
      // Map the value to Y axis (inverted so higher values go UP)
      final double normalizedY = (visibleRed[i] - paddedMin) / paddedRange;
      final double y = size.height - (normalizedY * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Draw red dot if this point is marked as a valley (heartbeat)
      if (valleySet.contains(visibleTs[i])) {
        canvas.drawCircle(Offset(x, y), 5.0, dotPaint);
      }
    }

    canvas.drawPath(path, linePaint);
    
    // Draw background grid lines
    final Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 1.0;
      
    for (int i = 0; i <= 4; i++) {
      final double y = size.height * (i / 4);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _PulseGraphPainter oldDelegate) {
    return true; // We want to repaint strictly on every state update
  }
}
