import 'package:go_router/go_router.dart';
import '../pages/home.dart';
import '../pages/app_router.dart';
import '../pages/tip_route.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Home(
          title: 'Espresso',
        ),
      ),
      GoRoute(
        path: '/app_route',
        builder: (context, state) => const AppRoute(),
      ),
      GoRoute(
        path: '/tip_route',
        builder: (context, state) {
          final extraData = state.extra as String?;
          return TipRoute(extraData: extraData);
        },
      ),
    ],
  );
}
