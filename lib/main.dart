import 'package:flutter/material.dart';
import 'util/router.dart';
import '../util/constants.dart' as constants;
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

final queryClient = QueryClient(
  defaultQueryOptions: DefaultQueryOptions(),
);

void main() {
  runApp(QueryClientProvider(queryClient: queryClient, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Espresso',
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
    );
  }
}
