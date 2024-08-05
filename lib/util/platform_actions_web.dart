// ignore: avoid_web_libraries_in_flutter
import 'package:universal_html/js.dart';

class PlatformActions {
  void setStatusBarColor(String color) {
    // implementation here
    context.callMethod('updateStatusBarColor', [color]);
  }
}

final platformActions = PlatformActions();
