import 'package:flutter/cupertino.dart';
import 'package:news_app/core/constant/endpoint.dart';
import 'package:news_app/data/interface/i_database_service.dart';
import 'package:news_app/data/model/news_model.dart';

/// Haberlerin çekildiği sınıf
@immutable
final class NewsRepositories {
  /// Haberlerin çekildiği sınıfın yapıcı metodu
  const NewsRepositories(this._service);
  final IDatabaseService _service;

  /// tüm haberleri getiren fonksiyon
  Future<NewsModel> getEverythingNews() async {
    final data = await _service.getData(NewsEndpoint.everything.value);
    return NewsModel.fromJson(data as Map<String, dynamic>);
  }

  /// haber başlıklarını getiren fonksyon
  Future<NewsModel> getTopHeadlinesNews() async {
    final data = await _service.getData(NewsEndpoint.topHeadlines.value);
    return NewsModel.fromJson(data as Map<String, dynamic>);
  }
}
