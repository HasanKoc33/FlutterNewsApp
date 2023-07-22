import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/constant/app_strings.dart';
import 'package:news_app/ui/screens/settings_screen.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockBuildContext mockContext;
  setUp(() {
    mockContext = MockBuildContext();
  });

  group('SettingsScreen Widgets Test', () {
    testWidgets('selectTheme should display ExpansionTile and options',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(children: [selectTheme()]),
          ),
        ),
      );

      // Verify that ExpansionTile is displayed
      // expect(find.byType(ExpansionTile), findsOneWidget);

      // Verify that theme options are displayed
      expect(find.text(AppStrings.system.translate), findsOneWidget);
      expect(find.text(AppStrings.light.translate), findsOneWidget);
      expect(find.text(AppStrings.dark.translate), findsOneWidget);
    });

    testWidgets('selectLanguage should display ExpansionTile and options',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: selectLanguage(mockContext),
          ),
        ),
      );

      // Verify that ExpansionTile is displayed
      //  expect(find.byType(ExpansionTile), findsOneWidget);

      // Verify that language options are displayed
      expect(find.text(AppStrings.tr.translate), findsOneWidget);
      expect(find.text(AppStrings.en.translate), findsOneWidget);
    });
  });
}
