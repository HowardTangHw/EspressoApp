import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            final res =
                await context.push<String?>('/tip_route', extra: 'some text');
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
