import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/widgets/vertical_list_item.dart';

void main() {
  testWidgets('HorizontalListItem widget should display correct content',
      (WidgetTester tester) async {
    // Test data: create a sample Articles object
    const articles = Articles(
      title: 'Test Title',
      description: 'Test Description',
      urlToImage: null,
    );

    // Build our widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VerticalListItem(articles: articles),
        ),
      ),
    );

    // Verify that the image is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verify that the title and description are displayed
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
  });
}
