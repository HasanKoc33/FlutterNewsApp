import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/utils/extension.dart';

void main() {
  testWidgets('ContextExtension should return correct screen width and height',
      (WidgetTester tester) async {
    // ekran boyutlarını getiren extension testi
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              final screenWidth = context.width;
              final screenHeight = context.height;

              expect(screenWidth, greaterThan(0.0));
              expect(screenHeight, greaterThan(0.0));

              return Container();
            },
          ),
        ),
      ),
    );
  });

  testWidgets('ContextExtension should return correct text theme',
      (WidgetTester tester) async {
    // yazı temasını getiren extension testi
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              final textTheme = context.textTheme;

              // text teması null değil mi
              expect(textTheme, isNotNull);

              // text tema içerisinde titleLarge var mı
              expect(textTheme.titleLarge, isNotNull);

              return Container();
            },
          ),
        ),
      ),
    );
  });

  testWidgets('ContextExtension should return correct theme and color scheme',
      (WidgetTester tester) async {
    // Build our widget
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: Builder(
            builder: (context) {
              final theme = context.theme;
              final colorScheme = context.colorScheme;

              // Verify that theme is not null
              expect(theme, isNotNull);

              // Verify that colorScheme is not null
              expect(colorScheme, isNotNull);

              // Verify that the primary color is blue
              expect(colorScheme.primary, equals(Colors.blue));

              return Container();
            },
          ),
        ),
      ),
    );
  });
}
