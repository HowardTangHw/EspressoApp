import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app.dart';
import 'router.dart';
import 'tip_route.dart';

void main() {
  runApp(const MainApp());
}

final _router = GoRouter(
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Espresso',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: _router,
    );
  }
}
