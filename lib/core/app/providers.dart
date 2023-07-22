part of 'app_config.dart';

/// Uygulama içerisinde kullanılacak providerların tutulduğu sınıf
final class Providers {
  Providers._();

  /// Uygulama içerisinde kullanılacak providerların tutulduğu liste
  static List<SingleChildWidget> get items => _items;
  static final _items = [
    BlocProvider<NewsCubit>(
      create: (context) => NewsCubit()..init(),
    ),
    BlocProvider<HeadlineNewsCubit>(
      create: (context) => HeadlineNewsCubit()..init(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()..init(),
    ),
  ];
}
