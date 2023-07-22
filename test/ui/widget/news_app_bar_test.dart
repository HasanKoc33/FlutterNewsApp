import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/ui/widgets/app_bar.dart';

void main() {
  testWidgets('NewsAppBar widget should display the title and settings icon',
      (WidgetTester tester) async {
    // Widget ı ayaga kaldırıyoruz
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: const NewsAppBar(pageTitle: 'Test Title', isAction: true),
          body: Container(),
        ),
      ),
    );

    // Test Title ekranda görünüyor olması lazım
    expect(find.text('Test Title'), findsOneWidget);

    // isAction true olduğu için ayarlar butonu ekranda görünüyor olması lazım
    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets(
      'NewsAppBar widget should display only the title when isAction is false',
      (WidgetTester tester) async {
    // Widget ı ayaga kaldırıyoruz
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: const NewsAppBar(pageTitle: 'Test Title'),
          body: Container(),
        ),
      ),
    );

    // Test Title ekranda görünüyor olması lazım
    expect(find.text('Test Title'), findsOneWidget);

    // Defult olarak isAction false olduğu için ayarlar butonu ekranda görünmüyor olması lazım
    expect(find.byIcon(Icons.settings), findsNothing);
  });
}
