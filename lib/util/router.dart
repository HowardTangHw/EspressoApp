import '../pages/home.dart';
import '../pages/tip_route.dart';
import '../pages/box_list.dart';
import '../pages/position.dart';
import '../pages/scrollcontroller.dart';
import '../pages/custom_scroll_view.dart';
import '../pages/profile.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppRouter {
  static final router = [
    GetPage(
      name: '/',
      page: () => const CupertinoScaffold(
          body: Home(
        title: 'Espresso',
      )),
    ),
    GetPage(
      name: '/tip_route',
      page: () {
        return const TipRoute();
      },
    ),
    GetPage(
      name: '/box_list',
      page: () {
        return BoxList();
      },
    ),
    GetPage(
      name: '/position_example',
      page: () {
        return const PositionExample();
      },
    ),
    GetPage(
      name: '/scollcontroller_example',
      page: () {
        return const ScrollControllerTestRoute();
      },
    ),
    GetPage(
      name: '/custom_scroll_view',
      page: () {
        return const CustomScrollViewPage();
      },
    ),
    GetPage(
      name: '/profile',
      page: () {
        return const CupertinoScaffold(
          body: ProfilePage(),
        );
      },
    ),
  ];
}
