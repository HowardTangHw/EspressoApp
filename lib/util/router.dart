import 'package:go_router/go_router.dart';
import '../pages/home.dart';
import '../pages/app_router.dart';
import '../pages/tip_route.dart';
import '../pages/box_list.dart';
import '../pages/position.dart';
import '../pages/scrollcontroller.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const Home(
                title: 'Espresso',
              ),
          routes: [
            GoRoute(
              path: 'app_route',
              builder: (context, state) => const AppRoute(),
            ),
            GoRoute(
              path: 'tip_route',
              builder: (context, state) {
                final extraData = state.extra as String?;
                return TipRoute(extraData: extraData);
              },
            ),
            GoRoute(
              path: 'box_list',
              builder: (context, state) {
                return BoxList();
              },
            ),
            GoRoute(
              path: 'position_example',
              builder: (context, state) {
                return const PositionExample();
              },
            ),
            GoRoute(
              path: 'scollcontroller_example',
              builder: (context, state) {
                return const ScrollControllerTestRoute();
              },
            ),
          ]),
    ],
  );
}
