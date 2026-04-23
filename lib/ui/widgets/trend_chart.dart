import 'package:flutter/material.dart';

import '../../models/vital_snapshot.dart';

class TrendChart extends StatelessWidget {
  final List<VitalSnapshot> data;

  const TrendChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrendChartPainter(data),
      size: const Size(double.infinity, 180),
    );
  }
}

class _TrendChartPainter extends CustomPainter {
  final List<VitalSnapshot> data;

  _TrendChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFFF2F5FA);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(12)),
      bgPaint,
    );

    final gridPaint = Paint()
      ..color = const Color(0xFFCAD3E0)
      ..strokeWidth = 1;
    for (int i = 1; i <= 4; i++) {
      final dy = size.height * i / 5;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), gridPaint);
    }

    if (data.length < 2) {
      return;
    }

    final values = data.map((item) => item.irWave.toDouble()).toList();
    double minValue = values.first;
    double maxValue = values.first;
    for (final value in values) {
      if (value < minValue) {
        minValue = value;
      }
      if (value > maxValue) {
        maxValue = value;
      }
    }

    final span = (maxValue - minValue).abs() < 1e-6 ? 1.0 : (maxValue - minValue);

    final linePaint = Paint()
      ..color = const Color(0xFF0B6E4F)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    for (int i = 0; i < values.length; i++) {
      final x = size.width * (i / (values.length - 1));
      final normalized = (values[i] - minValue) / span;
      final y = size.height - (normalized * (size.height - 8)) - 4;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _TrendChartPainter oldDelegate) {
    return oldDelegate.data != data;
  }
}
