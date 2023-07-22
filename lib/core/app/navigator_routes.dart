part of 'app_config.dart';

/// Uygulamanın rotalarının tanımlandığı sınıf
final class NavigatorRoutes {
  NavigatorRoutes._();

  /// rotalar
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: RouteName.splash.path,
    routes: <RouteBase>[
      GoRoute(
        path: RouteName.splash.path,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: RouteName.home.path,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: RouteName.detail.name,
            builder: (BuildContext context, GoRouterState state) {
              final articles = state.extra;
              if (articles is Articles) {
                return NewsDetailPage(articles: articles);
              }
              return const HomePage();
            },
          ),
          GoRoute(
            path: RouteName.settings.name,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsScreen();
            },
          ),
        ],
      ),
    ],
  );
}
