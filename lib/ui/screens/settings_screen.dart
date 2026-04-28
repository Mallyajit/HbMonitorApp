import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app_state.dart';

/// Settings screen with mandatory age/gender + device calibration.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _ageController = TextEditingController();
  String? _selectedGender;

  final _baselineRedController = TextEditingController();
  final _baselineIrController = TextEditingController();
  final _vrefController = TextEditingController();

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final state = context.read<HemePulseAppState>();
    _ageController.text = state.userAge?.toString() ?? '';
    _selectedGender = state.userGender;
    _baselineRedController.text = state.calibration.baselineRedAdc.toStringAsFixed(0);
    _baselineIrController.text = state.calibration.baselineIrAdc.toStringAsFixed(0);
    _vrefController.text = state.calibration.baselineVoltageMv.toString();
    _initialized = true;
  }

  @override
  void dispose() {
    _ageController.dispose();
    _baselineRedController.dispose();
    _baselineIrController.dispose();
    _vrefController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HemePulseAppState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ── Profile Section (mandatory) ──
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
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEE2E2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: Color(0xFFEF4444), size: 28),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('User Profile', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          Text(
                            state.profileComplete ? 'Age: ${state.userAge} • ${state.userGender}' : 'Required before scanning',
                            style: TextStyle(
                              fontSize: 13,
                              color: state.profileComplete ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      labelText: 'Age *',
                      hintText: 'Enter your age',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.cake),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      labelText: 'Gender *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.wc),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Male', child: Text('Male')),
                      DropdownMenuItem(value: 'Female', child: Text('Female')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (val) => setState(() => _selectedGender = val),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final age = int.tryParse(_ageController.text.trim());
                        if (age == null || age < 1 || age > 120) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Enter a valid age (1-120).')),
                          );
                          return;
                        }
                        if (_selectedGender == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please select your gender.')),
                          );
                          return;
                        }
                        await state.saveUserProfile(age: age, gender: _selectedGender!);
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile saved ✓')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEF4444),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Save Profile'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── Device Calibration ──
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Device Calibration',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Baseline: ${state.calibration.baselineValid ? "Valid (R=${state.calibration.userBaselineR.toStringAsFixed(4)})" : "Not set"}',
                    style: TextStyle(
                      fontSize: 12,
                      color: state.calibration.baselineValid ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _baselineRedController,
                    decoration: InputDecoration(
                      labelText: 'Baseline Red ADC',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _baselineIrController,
                    decoration: InputDecoration(
                      labelText: 'Baseline IR ADC',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _vrefController,
                    decoration: InputDecoration(
                      labelText: 'Baseline voltage (mV)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final red = double.tryParse(_baselineRedController.text.trim()) ?? 100.0;
                            final ir = double.tryParse(_baselineIrController.text.trim()) ?? 100.0;
                            final vref = double.tryParse(_vrefController.text.trim()) ?? 1200.0;
                            await state.saveCalibration(
                              baselineRedAdc: red,
                              baselineIrAdc: ir,
                              baselineVoltageMv: vref,
                              userBaselineR: state.calibration.userBaselineR,
                              baselineValid: true,
                            );
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Calibration saved ✓')),
                            );
                          },
                          icon: const Icon(Icons.save, size: 18),
                          label: const Text('Save'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEF4444),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => state.startBaselineCapture(),
                          icon: const Icon(Icons.sensors, size: 18),
                          label: const Text('Capture Baseline'),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await state.clearBaseline();
                        // Update UI fields
                        _baselineRedController.text = '100';
                        _baselineIrController.text = '100';
                        _vrefController.text = '1200';
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Baseline cleared to defaults (100/100/1200mV).')),
                        );
                      },
                      icon: const Icon(Icons.delete_outline, size: 18),
                      label: const Text('Clear Baseline'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFEF4444),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (state.alertMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    state.alertMessage!,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF92400E)),
                  ),
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
