import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app/app.dart';
import 'package:news_app/core/app/app_locale.dart';
import 'package:news_app/data/service/local_storage_service.dart';

Future<void> main() async {
  await init();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocale.supportedLocales,
      path: AppLocale.assetsPath,
      fallbackLocale: AppLocale.fallbackLocale,
      child: const App(),
    ),
  );
}

/// uygulama başlamadan önce initalize edilmesi zorunlu kısımları
/// initialize eder
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocalStorageService().init();
}
