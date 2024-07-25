import 'package:flutter/material.dart';
import 'util/router.dart';
import '../util/constants.dart' as constants;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Espresso',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: constants.Colors.secondary,
          brightness: Brightness.light,
        ),
        fontFamily: 'Montserrat',
        primarySwatch: constants.Colors.primarySwatch,
        appBarTheme: const AppBarTheme(
          backgroundColor: constants.Colors.background,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
