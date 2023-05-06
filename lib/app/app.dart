import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_cubit/headline_news_cubit.dart';
import 'package:news_app/ui/pages/home_page.dart';

import '../bloc/news_cubit/news_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffeeeeee),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color(0xff000000), secondary: const Color(0xffeeeeee)),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NewsCubit>(
            create: (context) => NewsCubit()..init(),
          ),
          BlocProvider<HeadlineNewsCubit>(
            create: (context) => HeadlineNewsCubit()..init(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
