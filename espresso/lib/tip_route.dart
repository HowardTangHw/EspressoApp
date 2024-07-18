import 'package:flutter/material.dart';

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
