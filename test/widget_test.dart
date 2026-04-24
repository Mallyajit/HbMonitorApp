import 'package:flutter_test/flutter_test.dart';

import 'package:hb_monitor_app/main.dart';

void main() {
  testWidgets('HemePulse app renders main navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HemePulseApp());

    expect(find.text('Scan'), findsOneWidget);
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Calibration'), findsOneWidget);
  });

  testWidgets('Dashboard shows BPM check option', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HemePulseApp());

    await tester.tap(find.text('Dashboard'));
    await tester.pumpAndSettle();

    expect(find.text('Monitoring Modes'), findsOneWidget);
    expect(find.text('BPM Check'), findsOneWidget);
    expect(find.text('Start BPM Check'), findsOneWidget);
  });
}
