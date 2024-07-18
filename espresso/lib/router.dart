import 'package:flutter/material.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({Key? key}) : super(key: key);

  @override
  AppRouteState createState() => AppRouteState();
}

class AppRouteState extends State<AppRoute> {
  void handleButton() async {
    Navigator.of(context).pushNamed("tip_route", arguments: "hi");
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    var text = args is String ? args : "没有参数";
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const Text("This is new route"),
        Text(text),
        ElevatedButton(
          onPressed: handleButton,
          child: const Text("打开新路由"),
        ),
      ])),
    );
  }
}
