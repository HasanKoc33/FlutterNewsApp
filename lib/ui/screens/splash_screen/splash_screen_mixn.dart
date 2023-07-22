import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/app/app_config.dart';
import 'package:news_app/data/service/local_storage_service.dart';
import 'package:news_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:news_app/utils/extension.dart';

/// splash screen mixin
mixin SplashScreenMixn on State<SplashScreen> {
  /// image in başlangıç boyutu
  double size = 200;

  @override
  void initState() {
    super.initState();
    Future.microtask(init);
  }

  /// uygulamanın kurulum ayarlarını yaptıgımız methot
  Future<void> init() async {
    setState(() {
      size = context.width;
    });
    await LocalStorageService().init();
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(milliseconds: 600));
    if (context.mounted) {
      context.go(RouteName.home.path);
    }
  }
}
