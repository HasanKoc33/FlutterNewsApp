import 'package:flutter/material.dart';

/// Uygulama dil kodlarını tutar
@immutable
final class AppLocale {
  /// constructor
  const AppLocale._();

  /// desteklenen diller
  static List<Locale> get supportedLocales => _supportedLocales;

  /// fallbackLocale
  static Locale get fallbackLocale => _supportedLocales.first;

  /// fallbackLocale
  static String get assetsPath => _path;

  /// Türkçe dil
  static Locale get tr => _supportedLocales.first;

  /// İngilizce dil
  static Locale get en => _supportedLocales.last;

  /// uygulama dil kodu
  static const List<Locale> _supportedLocales = [
    Locale('tr', 'TR'),
    Locale('en', 'US')
  ];

  /// uygulama dil kodu
  static const String _path = 'assets/translations';
}
