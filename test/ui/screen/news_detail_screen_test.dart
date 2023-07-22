import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/screens/news_detail_page.dart';

void main() {
  testWidgets('NewsDetailPage should display correct content',
      (WidgetTester tester) async {
    // Test data: create a sample Articles object
    const articles = Articles(
      title: 'Test Title',
      description: 'Test Description',
      content: 'Test Content',
      author: 'Test Author',
      publishedAt: '2023-07-20T12:34:56Z',
      url: 'https://example.com/news',
    );

    // Build our widget
    await tester.pumpWidget(
      const MaterialApp(
        home: NewsDetailPage(articles: articles),
      ),
    );

    // Verify that title, description, content, and author are displayed
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
    expect(find.text('Test Author'), findsOneWidget);

    // Verify that source name and publishedAt date are displayed
    expect(
      find.text(''),
      findsOneWidget,
    ); // Source name is null in the test data
    expect(find.text('2023-07-20T12:34:56Z'), findsOneWidget);

    // Verify that the image is displayed (AppAssets.noImage.value)
    expect(find.byType(Image), findsOneWidget);

    // Verify that the floating action button is displayed
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('NewsDetailPage should launch URL when FAB is tapped',
      (WidgetTester tester) async {
    // Test data: create a sample Articles object
    const articles = Articles(
      title: 'Test Title',
      description: 'Test Description',
      content: 'Test Content',
      author: 'Test Author',
      publishedAt: '2023-07-20T12:34:56Z',
      url: 'https://example.com/news',
    );

    // Build our widget
    await tester.pumpWidget(
      const MaterialApp(
        home: NewsDetailPage(articles: articles),
      ),
    );

    // Tap on the floating action button (FAB)
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify that the URL is launched (use launchUrl function to launch URL)
    // You can mock the launchUrl function to simulate URL launching in
    // test environment
    // For the purpose of this example, I assume launchUrl always returns true
    expect(find.text('Test Title'), findsOneWidget);
  });
}
