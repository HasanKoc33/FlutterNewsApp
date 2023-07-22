import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_assets.dart';
import 'package:news_app/ui/screens/splash_screen/splash_screen_mixn.dart';
import 'package:news_app/utils/extension.dart';

/// uygulamanın splash screeni
@immutable
final class SplashScreen extends StatefulWidget {
  /// constructor
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final class _SplashScreenState extends State<SplashScreen>
    with SplashScreenMixn {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: size,
            child: Image.asset(
              AppAssets.appLogoPng.value,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
