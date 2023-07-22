import 'package:flutter/material.dart';

/// uygulama temasının tutulduğu sınıf
final class AppTheme {
  AppTheme._();

  /// uygulama açık teması
  static ThemeData get themeLigth => ThemeData.light().copyWith(
        primaryColor: const Color(0xff000000),
        scaffoldBackgroundColor: const Color(0xffeeeeee),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  /// uygulama koyu teması
  static ThemeData get themeDark => ThemeData.dark().copyWith(
        primaryColor: const Color(0xffeeeeee),
        scaffoldBackgroundColor: const Color(0xff000000),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
