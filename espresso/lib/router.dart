import 'package:flutter/material.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({Key? key}) : super(key: key);

  @override
  AppRouteState createState() => AppRouteState();
}

class AppRouteState extends State<AppRoute> {
  String? msg;

  void handleButton() async {
    var result =
        await Navigator.of(context).pushNamed("tip_route", arguments: "hi");
    print("路由返回值:$result");
    setState(() {
      msg = result as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const Text("This is new route"),
        Text(msg ?? "还没有参数"),
        ElevatedButton(
          onPressed: handleButton,
          child: const Text("打开新路由"),
        ),
      ])),
    );
  }
}

class TipRoute extends StatelessWidget {
  const TipRoute({
    Key? key, // 接收一个text参数
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    var text = args is String ? args : "没有参数";
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(
                  context,
                  "pop的返回值",
                ),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
