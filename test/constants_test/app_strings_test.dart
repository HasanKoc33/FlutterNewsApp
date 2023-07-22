// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/constant/app_strings.dart';

void main() {
  test('App Strings test', () {
    final test = AppStrings.theme.translate;
    expect(test, 'theme');
  });
}
