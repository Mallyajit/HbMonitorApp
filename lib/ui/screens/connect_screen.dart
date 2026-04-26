import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

/// Connect screen matching ConnectScreen.tsx design.
class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HemePulseAppState>(
      builder: (context, state, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Connect Device',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Connected device card
                  if (state.connected)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDCFCE7),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.bluetooth_connected, color: Color(0xFF16A34A), size: 24),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('HemePulse Sensor', style: TextStyle(fontWeight: FontWeight.w600)),
                                Text('Connected', style: TextStyle(fontSize: 13, color: Color(0xFF16A34A))),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => state.disconnect(),
                            child: const Text('Disconnect', style: TextStyle(color: Color(0xFFEF4444), fontSize: 13)),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Available devices
                  Container(
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
                            const Text('Available Devices', style: TextStyle(fontWeight: FontWeight.w600)),
                            IconButton(
                              onPressed: state.scanning ? null : () => state.startBleScan(),
                              icon: Icon(
                                Icons.refresh,
                                color: state.scanning ? Colors.grey : const Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                        if (state.scanning)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        if (state.scanResults.isEmpty && !state.scanning)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: Text(
                                'Tap refresh to scan for devices',
                                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
                              ),
                            ),
                          ),
                        ...state.scanResults.map((result) => _DeviceListItem(
                              result: result,
                              onConnect: () => state.connectToScanResult(result),
                              isConnecting: state.connecting,
                            )),
                      ],
                    ),
                  ),

                  if (state.lastError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        state.lastError!,
                        style: const TextStyle(color: Color(0xFFEF4444), fontSize: 13),
                      ),
                    ),

                  const Spacer(),

                  // Tip card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Connection Tips',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1E3A5F)),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Keep the sensor close to your device and ensure Bluetooth is enabled.',
                          style: TextStyle(fontSize: 12, color: Color(0xFF3B82F6)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DeviceListItem extends StatelessWidget {
  final ScanResult result;
  final VoidCallback onConnect;
  final bool isConnecting;

  const _DeviceListItem({
    required this.result,
    required this.onConnect,
    required this.isConnecting,
  });

  @override
  Widget build(BuildContext context) {
    final name = result.device.platformName.isNotEmpty
        ? result.device.platformName
        : 'Unknown Device';

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.bluetooth, color: Color(0xFF3B82F6), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                Text(
                  'Signal: ${result.rssi > -60 ? "Strong" : (result.rssi > -80 ? "Medium" : "Weak")}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: isConnecting ? null : onConnect,
            child: Text(
              isConnecting ? 'Connecting...' : 'Pair',
              style: const TextStyle(color: Color(0xFF3B82F6), fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
