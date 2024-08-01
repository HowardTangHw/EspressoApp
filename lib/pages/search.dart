import 'package:flutter/material.dart';
import '../components/progress.dart';
import '../util/constants.dart' as constants;
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Scrollbar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                    fontSize: 20,
                    color: constants.Colors.primary,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Wrap(children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed("/profile");
                    },
                    child: const Text("profile")),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/app_route");
                    },
                    child: const Text("open new route")),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/box_list");
                    },
                    child: const Text("open box list")),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/position_example");
                    },
                    child: const Text("open Position")),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/scollcontroller_example");
                    },
                    child: const Text("open scroll")),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/custom_scroll_view");
                    },
                    child: const Text("open custom scroll")),
              ]),
              const ProgressComponent(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        " hello world ",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(" I am Jack "),
                    ],
                  ),
                ],
              ),
              Container(
                color: constants.Colors.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                    children: <Widget>[
                      Container(
                        color: constants.Colors.accent,
                        child: const Column(
                          mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                          children: <Widget>[
                            Text("hello world "),
                            Text("I am Jack "),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 100.0,
                  child: Flex(direction: Axis.vertical, children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        color: Colors.green,
                      ),
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
