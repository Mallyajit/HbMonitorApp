import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/app_state.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/connect_screen.dart';
import 'ui/screens/analytics_screen.dart';
import 'ui/screens/settings_screen.dart';

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
            seedColor: const Color(0xFFEF4444),
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        ),
        home: const _AppShell(),
      ),
    );
  }
}

class _AppShell extends StatefulWidget {
  const _AppShell();

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[
      HomeScreen(),
      ConnectScreen(),
      AnalyticsScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFEE2E2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFFEF4444)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bluetooth_outlined),
            selectedIcon: Icon(Icons.bluetooth, color: Color(0xFFEF4444)),
            label: 'Connect',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart, color: Color(0xFFEF4444)),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings, color: Color(0xFFEF4444)),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
