import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repostories/news_repositories.dart';
import 'package:news_app/data/service/http_service.dart';

// Create a mock implementation of the http.Client
class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('HttpService', () {
    // Declare the HttpService and the mock http.Client
    late HttpService httpService;
    late NewsRepositories newsRepositories;

    setUp(() {
      // Initialize the mock http.Client before each test
      httpService = HttpService();
      newsRepositories = NewsRepositories(httpService);
    });

    test('getData throws NewsError when http call fails', () async {
      // Define the test endpoint

      // Call the getData method and expect it to throw a NewsError
      expect(
        () => newsRepositories.getTopHeadlinesNews(),
        equals(Future<NewsModel>),
      );
    });
  });
}
