import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Circular progress indicator with a blood drop icon in the center.
/// Matches the React CircularProgress.tsx design exactly.
class CircularProgressWidget extends StatelessWidget {
  final double progress; // 0-100
  final double size;
  final double strokeWidth;

  const CircularProgressWidget({
    super.key,
    required this.progress,
    this.size = 120,
    this.strokeWidth = 6,
  });

  @override
  Widget build(BuildContext context) {
    final centerSize = size * 0.75;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated arc
          CustomPaint(
            size: Size(size, size),
            painter: _ArcPainter(
              progress: progress,
              strokeWidth: strokeWidth,
            ),
          ),
          // White circle with blood drop
          Container(
            width: centerSize,
            height: centerSize,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.water_drop,
                color: const Color(0xFFEF4444),
                size: centerSize * 0.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  _ArcPainter({required this.progress, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = (progress / 100) * 2 * math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start from top
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ArcPainter old) => old.progress != progress;
}
