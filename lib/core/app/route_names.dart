part of 'app_config.dart';

/// Uygulşama sayfa isimlerinin tutulduğu enum
enum RouteName {
  /// Splash Screen
  splash('/', '/'),

  /// Anasayfa
  home('/home', 'home'),

  /// hber detay sayfası
  detail('/detail', 'detail'),

  /// Anasayfa
  settings('/home/settings', 'settings');

  const RouteName(this.path, this.routeName);

  /// Sayfa isimleri
  final String routeName;

  /// Sayfa pathleri
  final String path;
}
