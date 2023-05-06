import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/bloc/news_cubit/headline_news_cubit.dart';
import 'package:news_app/bloc/news_cubit/news_cubit.dart';
import 'package:news_app/ui/companent/vertical_list_item.dart';
import 'package:news_app/ui/static_pages/loading_page.dart';
import 'package:news_app/util/extension.dart';

import '../companent/horizontal_item.dart';
import '../static_pages/error_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              title: Text(
                "News App",
                style: GoogleFonts.newRocker(
                  color: Colors.white,
                ),
              ),
            )),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
                if (state is NewsLoaded) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.newsModel.articles!.length,
                    itemBuilder: (context, index) {
                      return HorizontalListItem(articles: state.newsModel.articles![index]);
                    },
                  );
                } else if (state is NewsLoading) {
                  return LoadingPage();
                } else if (state is NewError) {
                  return ErrorPage(
                    error: state.error,
                  );
                } else {
                  return const Center();
                }
              }),
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<HeadlineNewsCubit, NewsState>(builder: (context, state) {
                if (state is NewsLoaded) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Headline News",
                            style: context.textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.newsModel.articles!.length,
                          itemBuilder: (context, index) {
                            return VerticalListItem(articles: state.newsModel.articles![index]);
                          },
                        ),
                      )
                    ],
                  );
                } else if (state is NewsLoading) {
                  return LoadingPage(
                    vertical: true,
                  );
                } else if (state is NewError) {
                  return ErrorPage(
                    error: state.error,
                  );
                } else {
                  return const Center();
                }
              }),
            ),
          ],
        )));
  }
}
