import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  AppRouteState createState() => AppRouteState();
}

class AppRouteState extends State<AppRoute> {
  String msg = "No Params";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const Text("This is new route"),
        Text(msg),
        ElevatedButton.icon(
          onPressed: () async {
            final res = await Get.toNamed('/tip_route', arguments: 'test');
            if (res != null) {
              setState(() {
                msg = res;
              });
            }
          },
          icon: const Icon(Icons.send),
          label: const Text("Push new Route"),
        ),
      ])),
    );
  }
}
