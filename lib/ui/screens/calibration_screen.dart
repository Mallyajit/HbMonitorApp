import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

class CalibrationScreen extends StatefulWidget {
  const CalibrationScreen({super.key});

  @override
  State<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends State<CalibrationScreen> {
  final TextEditingController _pdController = TextEditingController();
  final TextEditingController _gainController = TextEditingController();
  final TextEditingController _vrefController = TextEditingController();
  final TextEditingController _baselineController = TextEditingController();

  bool _baselineValid = false;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) {
      return;
    }

    final state = context.read<HemePulseAppState>();
    _pdController.text = state.calibration.photodiodeSensitivityAw.toString();
    _gainController.text = state.calibration.amplifierGainVPerA.toString();
    _vrefController.text = state.calibration.baselineVoltageMv.toString();
    _baselineController.text = state.calibration.userBaselineR.toString();
    _baselineValid = state.calibration.baselineValid;
    _initialized = true;
  }

  @override
  void dispose() {
    _pdController.dispose();
    _gainController.dispose();
    _vrefController.dispose();
    _baselineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HemePulseAppState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Calibration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Hardware placeholders and baseline values',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _pdController,
            decoration: const InputDecoration(
              labelText: 'Photodiode sensitivity (A/W)',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _gainController,
            decoration: const InputDecoration(
              labelText: 'Amplifier gain (V/A)',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _vrefController,
            decoration: const InputDecoration(
              labelText: 'Baseline voltage reference (mV)',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _baselineController,
            decoration: const InputDecoration(
              labelText: 'User baseline R',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Baseline value is valid'),
            value: _baselineValid,
            onChanged: (value) => setState(() => _baselineValid = value),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () async {
              final pd = double.tryParse(_pdController.text.trim()) ?? 0;
              final gain = double.tryParse(_gainController.text.trim()) ?? 0;
              final vref = double.tryParse(_vrefController.text.trim()) ?? 1200;
              final baseline = double.tryParse(_baselineController.text.trim()) ?? 0;

              await state.saveCalibration(
                photodiodeSensitivityAw: pd,
                amplifierGainVPerA: gain,
                baselineVoltageMv: vref,
                userBaselineR: baseline,
                baselineValid: _baselineValid,
              );

              if (!context.mounted) {
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calibration saved.')),
              );
            },
            icon: const Icon(Icons.save),
            label: const Text('Save Calibration'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () async {
              await state.clearBaseline();
              if (!context.mounted) {
                return;
              }
              _baselineController.text = '0';
              setState(() => _baselineValid = false);
            },
            icon: const Icon(Icons.delete_outline),
            label: const Text('Clear Baseline'),
          ),
        ],
      ),
    );
  }
}
