import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/theme_provider/theme_provider.dart';
import 'package:news_app/core/app/app_locale.dart';
import 'package:news_app/core/constant/app_padding.dart';
import 'package:news_app/core/constant/app_strings.dart';
import 'package:news_app/ui/widgets/app_bar.dart';
import 'package:provider/provider.dart';

part '../widgets/settings_widget.dart';

/// uygulama ayarlarının yapıldıgı sayfa
@immutable
class SettingsScreen extends StatelessWidget {
  /// constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(
        pageTitle: AppStrings.settings.translate,
      ),
      body: ListView(
        children: [
          selectTheme(),
          selectLanguage(context),
        ],
      ),
    );
  }
}
