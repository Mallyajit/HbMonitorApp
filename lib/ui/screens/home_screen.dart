import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';
import '../widgets/circular_progress_widget.dart';

/// Home screen matching the React HomeScreen.tsx design.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HemePulseAppState>(
      builder: (context, state, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 12),
                // ── Header ──
                _buildHeader(),
                const SizedBox(height: 12),

                // ── Device Status ──
                _buildDeviceStatus(state),
                const SizedBox(height: 16),

                // ── Main Hb Card ──
                _buildHbCard(state),
                const SizedBox(height: 16),

                // ── Start Scan Button ──
                _buildScanButton(state),
                const SizedBox(height: 16),

                // ── Metrics Row ──
                _buildMetricsRow(state),
                const SizedBox(height: 16),

                // ── Hb Trend Chart ──
                _buildTrendChart(state),
                const SizedBox(height: 16),

                // ── Health Tip ──
                _buildTip(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Heme',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Text(
          'Pulse',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEF4444),
          ),
        ),
        const SizedBox(width: 4),
        Icon(Icons.show_chart, color: const Color(0xFFEF4444), size: 20),
      ],
    );
  }

  Widget _buildDeviceStatus(HemePulseAppState state) {
    final isConnected = state.connected;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isConnected ? const Color(0xFF22C55E) : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.bluetooth, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isConnected ? 'Device Connected' : 'Not Connected',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  isConnected ? 'HemePulse Sensor' : 'Go to Connect tab',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          if (isConnected)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF22C55E).withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(3, (i) => Container(
                    width: 3,
                    height: 12,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )),
                  const SizedBox(width: 4),
                  Text(
                    state.healthState,
                    style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHbCard(HemePulseAppState state) {
    final hb = state.lastHbValue;
    final statusLabel = hb >= 12.0 ? 'Normal' : (hb >= 11.0 ? 'Low' : 'Critical');

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF87171), Color(0xFFEF4444)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hemoglobin (Hb)',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hb.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'g/dL',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: hb >= 12 ? const Color(0xFFEF4444) : Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          statusLabel,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: hb >= 12 ? const Color(0xFFEF4444) : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.lastScanTime != null
                        ? 'Last updated: Today, ${state.lastScanTime!.hour.toString().padLeft(2, '0')}:${state.lastScanTime!.minute.toString().padLeft(2, '0')}'
                        : 'No scan yet',
                    style: const TextStyle(color: Colors.white60, fontSize: 11),
                  ),
                ],
              ),
              // Circular progress with blood drop
              CircularProgressWidget(
                progress: state.isScanning ? state.scanProgress.toDouble() : 100,
                size: 110,
                strokeWidth: 5,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Normal Range: 12.0 – 16.0 g/dL',
            style: TextStyle(color: Colors.white60, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton(HemePulseAppState state) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: state.isScanning ? null : () => state.startScan(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF4444),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFFEF4444).withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 4,
        ),
        child: Text(
          state.isScanning
              ? 'Scanning... ${state.scanProgress}%'
              : 'Start Scan',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildMetricsRow(HemePulseAppState state) {
    return Row(
      children: [
        Expanded(
          child: _MetricTile(
            icon: Icons.favorite,
            iconColor: const Color(0xFFEF4444),
            label: 'Heart Rate',
            value: '${state.lastBpm}',
            unit: 'bpm',
            statusLabel: state.lastBpm >= 60 && state.lastBpm <= 100 ? 'Normal' : (state.lastBpm == 0 ? '—' : 'Check'),
            statusColor: state.lastBpm >= 60 && state.lastBpm <= 100 ? const Color(0xFF22C55E) : Colors.orange,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _MetricTile(
            icon: Icons.water_drop,
            iconColor: const Color(0xFF3B82F6),
            label: 'SpO₂',
            value: '${state.lastSpo2}',
            unit: '%',
            statusLabel: state.lastSpo2 >= 95 ? 'Normal' : 'Low',
            statusColor: state.lastSpo2 >= 95 ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _MetricTile(
            icon: Icons.monitor_heart,
            iconColor: const Color(0xFF8B5CF6),
            label: 'Signal',
            value: state.connected ? 'Good' : 'N/A',
            unit: '',
            statusLabel: '',
            statusColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _buildTrendChart(HemePulseAppState state) {
    final history = state.scanHistory;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hb Trend',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              Text(
                'Last ${history.length} scans',
                style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: history.isEmpty
                ? const Center(
                    child: Text(
                      'No scan data yet. Start your first scan!',
                      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                    ),
                  )
                : CustomPaint(
                    size: const Size(double.infinity, 120),
                    painter: _TrendPainter(
                      values: history
                          .reversed
                          .take(7)
                          .toList()
                          .reversed
                          .map((h) => (h['hb'] as double?) ?? 13.0)
                          .toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTip() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFCE8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Text('💡', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tip for you',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  'Eat iron-rich foods like spinach, lentils, and meat for healthy hemoglobin levels.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
          const Text('🥗', style: TextStyle(fontSize: 28)),
        ],
      ),
    );
  }
}

// ── Small Metric Tile ──
class _MetricTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String unit;
  final String statusLabel;
  final Color statusColor;

  const _MetricTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.unit,
    required this.statusLabel,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (unit.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2, left: 2),
                  child: Text(unit, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                ),
            ],
          ),
          if (statusLabel.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                statusLabel,
                style: TextStyle(fontSize: 11, color: statusColor, fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Simple Trend Line Painter ──
class _TrendPainter extends CustomPainter {
  final List<double> values;

  _TrendPainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.isEmpty) return;

    double minV = values.reduce((a, b) => a < b ? a : b) - 0.5;
    double maxV = values.reduce((a, b) => a > b ? a : b) + 0.5;
    if (maxV - minV < 1) { minV -= 0.5; maxV += 0.5; }

    final linePaint = Paint()
      ..color = const Color(0xFFEF4444)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = const Color(0xFFEF4444)
      ..style = PaintingStyle.fill;

    final path = Path();
    final stepX = values.length > 1 ? size.width / (values.length - 1) : 0.0;

    for (int i = 0; i < values.length; i++) {
      final x = i * stepX;
      final y = size.height - ((values[i] - minV) / (maxV - minV)) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      canvas.drawCircle(Offset(x, y), 4, dotPaint);

      // Value label
      final tp = TextPainter(
        text: TextSpan(
          text: values[i].toStringAsFixed(1),
          style: const TextStyle(fontSize: 9, color: Color(0xFF6B7280)),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, y - 16));
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _TrendPainter old) => true;
}
