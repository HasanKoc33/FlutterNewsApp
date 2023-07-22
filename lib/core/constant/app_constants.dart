/// Uyuglama sabitleri
enum AppConstants {
  /// Haberlerin çekileceği api host adresi
  newsHost('newsapi.org'),

  /// News api key
  apiKey('401ac27513f84f94b036be2316f43d82');

  const AppConstants(this.value);

  /// Sabit degeri
  final String value;
}
