/// Uyuglama assetleri
enum AppAssets {
  /// Uygulama logosu
  noImage('assets/images/news_im.jpeg'),

  /// Uygulama logosu
  appLogo('assets/images/news_app_icon.png'),

  /// Uygulama logosu png
  appLogoPng('assets/images/news_icon.png'),

  /// Yükleniyor animasyon gif yolu normal tema
  loadingLight('assets/gif/loading.gif'),

  /// Yükleniyor animasyon gif yolu dartk tema
  loadingDark('assets/gif/loading_dark.gif');

  const AppAssets(this.value);

  /// Asset degeri
  final String value;
}
