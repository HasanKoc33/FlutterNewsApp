import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit/headline_news_cubit.dart';
import 'package:news_app/bloc/news_cubit/news_cubit.dart';
import 'package:news_app/core/constant/app_flex.dart';
import 'package:news_app/core/constant/app_padding.dart';
import 'package:news_app/core/constant/app_strings.dart';
import 'package:news_app/ui/static_pages/error_page.dart';
import 'package:news_app/ui/static_pages/loading_page.dart';
import 'package:news_app/ui/widgets/app_bar.dart';
import 'package:news_app/ui/widgets/horizontal_item.dart';
import 'package:news_app/ui/widgets/vertical_list_item.dart';
import 'package:news_app/utils/extension.dart';

part '../widgets/home_screen_widgets.dart';

/// uygulamanın anasayfası
final class HomePage extends StatelessWidget {
  /// constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(
        pageTitle: AppStrings.appName.translate,
        isAction: true,
      ),
      body: Column(
        children: [
          _horicontalList(),
          _verticalList(),
        ],
      ),
    );
  }
}
