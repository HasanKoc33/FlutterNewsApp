/// Haberlerin çekildiği sınıfın hata sınıfı
final class NewsError extends Error {
  /// Haberlerin çekildiği sınıfın yapıcı metodu
  NewsError(this.message);

  /// hata mesajı
  final String message;
}
