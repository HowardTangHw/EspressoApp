import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipRoute extends StatelessWidget {
  const TipRoute({super.key, this.extraData});
  final String? extraData;

  @override
  Widget build(BuildContext context) {
    var text = extraData ?? "没有参数";
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
                onPressed: () => context.pop("text"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
