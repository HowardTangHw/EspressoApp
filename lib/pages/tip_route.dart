import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipRoute extends StatelessWidget {
  const TipRoute({super.key, this.extraData});
  final String? extraData;

  @override
  Widget build(BuildContext context) {
    var text = extraData ?? "No Params";
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
                onPressed: () => context.pop("text"),
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
