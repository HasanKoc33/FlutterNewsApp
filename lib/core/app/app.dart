import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/theme_provider/theme_provider.dart';
import 'package:news_app/core/app/app_config.dart';
import 'package:news_app/core/app/app_theme.dart';
import 'package:news_app/core/constant/app_strings.dart';
import 'package:provider/provider.dart';

/// uygulamanın başlangıç noktası
@immutable
class App extends StatelessWidget {
  /// constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.items,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return FutureBuilder(
            future: themeProvider.getTheme(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center();
              }
              return MaterialApp.router(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.themeLigth,
                darkTheme: AppTheme.themeDark,
                themeMode: snapshot.data == AppStrings.system.name
                    ? ThemeMode.system
                    : snapshot.data == AppStrings.light.name
                        ? ThemeMode.light
                        : ThemeMode.dark,
                routerConfig: NavigatorRoutes.router,
              );
            },
          );
        },
      ),
    );
  }
}
