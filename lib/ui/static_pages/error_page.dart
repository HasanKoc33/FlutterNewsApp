import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_cubit/news_error.dart';
import 'package:news_app/core/constant/app_strings.dart';

/// Hata Alındıgında gösterilecek sayfa
@immutable
final class ErrorPage extends StatelessWidget {
  /// Hata Alındıgında gösterilecek sayfa
  const ErrorPage({required this.error, super.key});

  /// Hata mesajı
  final NewsError error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${AppStrings.error.translate} : ${error.message}'),
      ),
    );
  }
}
