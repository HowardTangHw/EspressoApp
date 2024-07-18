import 'package:flutter/material.dart';
import 'app.dart';
import 'router.dart';
import 'tip_route.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final routes = {
    '/': (context) => const Home(
          title: 'Espresso',
        ),
    'app_route': (context) => const AppRoute(),
    'tip_route': (context) => const TipRoute(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espresso',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      onGenerateRoute: (settings) {
        final String? name = settings.name;
        final Widget Function(BuildContext)? pageContentBuilder = routes[name];

        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context),
              settings: settings,
            );
            return route;
          } else {
            final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context),
            );
            return route;
          }
        } else {
          // 返回一个空白页面
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Page Not Found'),
              ),
              body: const Center(
                child: Text('404 - Page Not Found'),
              ),
            ),
          );
        }
      },
    );
  }
}
