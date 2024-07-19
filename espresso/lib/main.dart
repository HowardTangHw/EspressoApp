import 'package:flutter/material.dart';
import 'util/router.dart';

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
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
