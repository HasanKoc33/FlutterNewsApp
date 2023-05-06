import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/errors/news_error.dart';
import '../../data/interface/IDatabase_service.dart';
import '../../data/model/news_model.dart';
import '../../data/repostories/news_repositories.dart';
import '../../data/service/http_service.dart';
import 'news_cubit.dart';

class HeadlineNewsCubit extends Cubit<NewsState> {
  HeadlineNewsCubit() : super(NewsInitial());

  NewsRepositories? _newsRepositories;
  IDatabaseService _service = HttpService();
  init() {
    _newsRepositories = NewsRepositories(_service);
    getNews();
  }

  Future<void> getNews() async {
    emit(NewsLoading());
    try {
      NewsModel data = await _newsRepositories!.getTopHeadlinesNews();
      emit(NewsLoaded(data));
    } catch (e) {
      emit(NewError(NewsError(e.toString())));
    }
  }
}
