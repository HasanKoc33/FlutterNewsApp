import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/news_error.dart';
import 'package:news_app/data/interface/IDatabase_service.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/repostories/news_repositories.dart';
import 'package:news_app/data/service/http_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  NewsRepositories? _newsRepositories;
  IDatabaseService _service = HttpService();
  init() {
    _newsRepositories = NewsRepositories(_service);
    getEverythingNews();
  }

  Future<void> getEverythingNews() async {
    emit(NewsLoading());
    try {
      NewsModel data = await _newsRepositories!.getEverythingNews();
      emit(NewsLoaded(data));
    } catch (e) {
      emit(NewError(NewsError(e.toString())));
    }
  }
}
