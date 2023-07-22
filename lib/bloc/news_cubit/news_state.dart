part of 'news_cubit.dart';

/// Haberlerin istek durumlarının tutulduğu sınıf
abstract class NewsState {}

/// Haberlerin istek durumlarının tutulduğu sınıfın başlangıç durumu
final class NewsInitial extends NewsState {}

/// Haberlerin istek durumlarının tutulduğu sınıfın yüklenme durumu
final class NewsLoading extends NewsState {}

/// Haberlerin istek durumlarının tutulduğu sınıfın yüklenme durumu
final class NewsLoaded extends NewsState {
  /// yükleme durumu yapıcı metodu
  NewsLoaded(this.newsModel);

  /// haberler
  final NewsModel newsModel;
}

/// Haberlerin istek durumlarının tutulduğu sınıfın yüklenme durumu
final class NewError extends NewsState {
  /// Haberlerin istek durumlarının tutulduğu sınıfın yüklenme durumu
  NewError(this.error);

  /// hata
  late final NewsError error;
}
