import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/core/constant/app_constants.dart';
import 'package:news_app/core/errors/news_error.dart';
import 'package:news_app/data/interface/IDatabase_service.dart';

class HttpService extends IDatabaseService {
  @override
  Future<Map> getData(String endPoint) async {
    try {
      Uri _url = Uri(scheme: 'https', host: AppConstants.newsHost.value, path: "v2/$endPoint", queryParameters: {'domains': 'wsj.com', 'language': 'en', 'apiKey': AppConstants.apiKey.value});
      print(_url.toString());
      var data = await get(_url);
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
    // TODO: implement init
    throw UnimplementedError();
  }
}
