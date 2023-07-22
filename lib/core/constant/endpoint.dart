/// News API Endpoint
enum NewsEndpoint {
  /// Haber başlıklarını getiren endpoint
  topHeadlines('top-headlines'),

  /// Tüm haberleri getiren endpoint
  everything('everything');

  const NewsEndpoint(this.value);

  /// Endpoint degeri
  final String value;
}
