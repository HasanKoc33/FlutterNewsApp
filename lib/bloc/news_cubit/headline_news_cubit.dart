import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit/news_cubit.dart';
import 'package:news_app/bloc/news_cubit/news_error.dart';
import 'package:news_app/data/interface/i_database_service.dart';
import 'package:news_app/data/repostories/news_repositories.dart';
import 'package:news_app/data/service/http_service.dart';

/// haber başlıklarının isteklerinin yapıldıgı cubit sınıfı
class HeadlineNewsCubit extends Cubit<NewsState> {
  /// haber başlıklarının isteklerinin yapıldıgı cubit sınıfı
  HeadlineNewsCubit() : super(NewsInitial());

  late NewsRepositories _newsRepositories;
  late IDatabaseService _service;

  /// kurulum methodu
  void init() {
    _service = HttpService();
    _newsRepositories = NewsRepositories(_service);
    getNews();
  }

  /// haber başlıklarını getiren fonksiyon
  Future<void> getNews() async {
    emit(NewsLoading());
    try {
      final data = await _newsRepositories.getTopHeadlinesNews();
      emit(NewsLoaded(data));
    } catch (e) {
      emit(NewError(NewsError(e.toString())));
    }
  }
}
