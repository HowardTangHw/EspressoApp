import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipRoute extends StatelessWidget {
  const TipRoute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var text = Get.arguments ?? "No Params";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton.icon(
                onPressed: () => Get.back(result: ("text")),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
