part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel newsModel;

  NewsLoaded(this.newsModel);
}

class NewError extends NewsState {
  final NewsError error;

  NewError(this.error);
}
