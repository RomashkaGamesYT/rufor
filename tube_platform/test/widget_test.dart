import 'package:flutter_test/flutter_test.dart';
import 'package:tube_platform/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TubePlatformApp());

    // Verify that the app builds.
    // Note: Since we are using GoRouter and ShadApp, pumping might require more setup for specific widgets,
    // but verifying it pumps without crashing is a good start.
    expect(find.byType(TubePlatformApp), findsOneWidget);
  });
}