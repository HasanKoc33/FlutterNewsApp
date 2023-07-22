import 'package:easy_localization/easy_localization.dart';

/// uygulama içinde kullanılan stringlerin tutulduğu enum
enum AppStrings {
  /// uygulama adı
  appName('app_name'),

  /// haberler başlıkları
  headlineNews('headline_news'),

  /// haberler başlıkları
  settings('settings'),

  /// haber detay
  newsDetail('news_detail'),

  /// tema
  theme('theme'),

  /// sistem
  system('system'),

  /// koyu
  dark('dark'),

  /// açık
  light('light'),

  /// dil
  language('language'),

  /// türkçe
  tr('turkish'),

  /// ingilizce
  en('english'),

  /// hata
  error('error');

  /// constructor
  const AppStrings(this._value);

  /// enum değerininin string karşılığı
  final String _value;

  /// verilen stringi translate eder
  String get translate => _value.tr();
}
