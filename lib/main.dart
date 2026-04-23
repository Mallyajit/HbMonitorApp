import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/app_state.dart';
import 'ui/screens/calibration_screen.dart';
import 'ui/screens/dashboard_screen.dart';
import 'ui/screens/scan_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HemePulseApp());
}

class HemePulseApp extends StatelessWidget {
  const HemePulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HemePulseAppState>(
      create: (_) => HemePulseAppState()..initialize(),
      child: MaterialApp(
        title: 'HemePulse Monitor',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0B6E4F),
            brightness: Brightness.light,
          ),
        ),
        home: const _HomeShell(),
      ),
    );
  }
}

class _HomeShell extends StatefulWidget {
  const _HomeShell();

  @override
  State<_HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<_HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[
      ScanScreen(),
      DashboardScreen(),
      CalibrationScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.bluetooth), label: 'Scan'),
          NavigationDestination(icon: Icon(Icons.monitor_heart), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.tune), label: 'Calibration'),
        ],
      ),
    );
  }
}
