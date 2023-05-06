import 'package:news_app/core/constant/endpoint.dart';
import 'package:news_app/data/interface/IDatabase_service.dart';

import '../model/news_model.dart';

class NewsRepositories {
  NewsRepositories(this._service);
  final IDatabaseService _service;

  Future<NewsModel> getEverythingNews() async {
    var data = await _service.getData(NewsEndpoint.everything.value);
    return NewsModel.fromJson(data);
  }

  Future<NewsModel> getTopHeadlinesNews() async {
    var data = await _service.getData(NewsEndpoint.topHeadlines.value);
    return NewsModel.fromJson(data);
  }
}
