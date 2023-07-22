import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/widgets/horizontal_item.dart';

void main() {
  testWidgets('HorizontalListItem widget should display correct content',
      (WidgetTester tester) async {
    // Test edebilmek için nesnemizi oluşturuyoruz
    const articles = Articles(
      title: 'Test Title',
      description: 'Test Description',
    );

    // Widget ayaklanıyor
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HorizontalListItem(articles: articles),
        ),
      ),
    );

    // imageUrl gelmediginde default image gosterilicek mi testi
    expect(find.byType(Image), findsOneWidget);

    // Stringler dogru gosteriliyor mu testi
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
  });
}
