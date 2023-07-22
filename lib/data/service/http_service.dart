import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/bloc/news_cubit/news_error.dart';
import 'package:news_app/core/constant/app_constants.dart';
import 'package:news_app/data/interface/i_database_service.dart';

/// Http hizmeti haberleri api den çekmek için kuıllanılır
final class HttpService extends IDatabaseService {
  @override
  Future<dynamic> getData(String endPoint) async {
    try {
      final url = Uri(
        scheme: 'https',
        host: AppConstants.newsHost.value,
        path: 'v2/$endPoint',
        queryParameters: {
          'domains': 'wsj.com',
          'language': 'en',
          'apiKey': AppConstants.apiKey.value
        },
      );

      final data = await get(url);

      // ignore: unnecessary_null_comparison
      if (data == null) {
        throw NewsError('Error getting data');
      }

      return json.decode(data.body);
    } catch (e) {
      throw NewsError(e.toString());
    }
  }

  @override
  Future<void> init() {
    throw UnimplementedError();
  }
}
