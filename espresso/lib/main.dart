import 'package:flutter/material.dart';
import 'app.dart';
import 'router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Espresso',
        initialRoute: '/',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          '/': (context) => const Home(
                title: 'Espresso',
              ),
          'app_route': (context) => const AppRoute(),
          'tip_route': (context) => const TipRoute(),
        });
  }
}
