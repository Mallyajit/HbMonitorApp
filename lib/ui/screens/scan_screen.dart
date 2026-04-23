import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HemePulseAppState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('HemePulse Connect')),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: state.connected
                    ? _buildConnectedBar(state)
                    : _buildScanBar(state),
              ),
              if (state.lastError != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    state.lastError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              if (state.connected)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    color: const Color(0xFFE8F5E9),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.bluetooth_connected,
                              color: Color(0xFF2E7D32)),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Connected to HemePulse device',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    itemCount: state.scanResults.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final result = state.scanResults[index];
                      final name = result.device.platformName.isNotEmpty
                          ? result.device.platformName
                          : (result.advertisementData.advName.isNotEmpty
                              ? result.advertisementData.advName
                              : 'Unknown HemePulse Device');

                      return ListTile(
                        leading: const Icon(Icons.bluetooth),
                        title: Text(name),
                        subtitle: Text(
                            '${result.device.remoteId.str} | RSSI ${result.rssi} dBm'),
                        trailing: FilledButton(
                          onPressed: state.connecting
                              ? null
                              : () => state.connectToScanResult(result),
                          child: Text(
                              state.connecting ? 'Connecting...' : 'Connect'),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildConnectedBar(HemePulseAppState state) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.tonalIcon(
            onPressed: state.disconnect,
            icon: const Icon(Icons.bluetooth_disabled),
            label: const Text('Disconnect'),
          ),
        ),
      ],
    );
  }

  Widget _buildScanBar(HemePulseAppState state) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: state.scanning ? null : state.startScan,
            icon: const Icon(Icons.bluetooth_searching),
            label:
                Text(state.scanning ? 'Scanning...' : 'Scan for HemePulse'),
          ),
        ),
      ],
    );
  }
}
