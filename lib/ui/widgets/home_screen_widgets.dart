part of '../screens/home_screen.dart';

Widget _verticalList() {
  return Expanded(
    flex: AppFlex.s.flex,
    child: BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.newsModel.articles!.length,
            itemBuilder: (context, index) {
              return HorizontalListItem(
                articles: state.newsModel.articles![index],
              );
            },
          );
        } else if (state is NewsLoading) {
          return const LoadingPage();
        } else if (state is NewError) {
          return ErrorPage(
            error: state.error,
          );
        } else {
          return const Center();
        }
      },
    ),
  );
}

Widget _horicontalList() {
  return Expanded(
    flex: AppFlex.m.flex,
    child: BlocBuilder<HeadlineNewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.m.padding),
                  child: Text(
                    AppStrings.headlineNews.translate,
                    style: context.textTheme.headlineMedium,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.newsModel.articles!.length,
                  itemBuilder: (context, index) {
                    return VerticalListItem(
                      articles: state.newsModel.articles![index],
                    );
                  },
                ),
              )
            ],
          );
        } else if (state is NewsLoading) {
          return const LoadingPage(
            vertical: true,
          );
        } else if (state is NewError) {
          return ErrorPage(
            error: state.error,
          );
        } else {
          return const Center();
        }
      },
    ),
  );
}
