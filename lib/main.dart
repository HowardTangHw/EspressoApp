import 'package:flutter/material.dart';
import 'util/router.dart';
import '../util/constants.dart' as constants;
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

final queryClient = QueryClient(
  defaultQueryOptions: DefaultQueryOptions(),
);

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.red));
  runApp(QueryClientProvider(queryClient: queryClient, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Espresso',
      themeMode: ThemeMode.light,
      onInit: () {
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarColor: Colors.red));
      },
      theme: ThemeData(
        platform: TargetPlatform.iOS,
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
      getPages: AppRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(statusBarColor: Colors.red),
            child: child!);
      },
    );
  }
}
