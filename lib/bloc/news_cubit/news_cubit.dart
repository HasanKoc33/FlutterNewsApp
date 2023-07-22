import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit/news_error.dart';
import 'package:news_app/data/interface/i_database_service.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repostories/news_repositories.dart';
import 'package:news_app/data/service/http_service.dart';

part 'news_state.dart';

/// Haberlerin isteklerinin yapıldıgı cubit sınıfı
class NewsCubit extends Cubit<NewsState> {
  /// Haberlerin isteklerinin yapıldıgı cubit sınıfı
  NewsCubit() : super(NewsInitial());

  late NewsRepositories _newsRepositories;
  late IDatabaseService _service;

  /// Cubitin kurulum methodu
  void init() {
    _service = HttpService();
    _newsRepositories = NewsRepositories(_service);
    getEverythingNews();
  }

  /// tüm haberleri getiren fonksiyon
  Future<void> getEverythingNews() async {
    emit(NewsLoading());
    try {
      final data = await _newsRepositories.getEverythingNews();
      emit(NewsLoaded(data));
    } catch (e) {
      emit(NewError(NewsError(e.toString())));
    }
  }
}
