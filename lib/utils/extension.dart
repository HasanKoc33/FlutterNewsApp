import 'package:flutter/material.dart';

/// Context üzerinden kullanılacak extensionlar
extension ContextExtension on BuildContext {
  /// ekranın genişliği
  double get width => MediaQuery.of(this).size.width;

  /// ekranın yüksekliği
  double get height => MediaQuery.of(this).size.height;

  /// uygulamanın yazı teması
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// uygulamanın teması
  ThemeData get theme => Theme.of(this);

  /// uygulamanın renk şeması
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
