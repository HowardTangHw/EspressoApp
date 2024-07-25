import 'package:flutter/material.dart';

class PositionExample extends StatelessWidget {
  const PositionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              color: Colors.blue,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  const Positioned(
                    left: 18.0,
                    
                    child: Text("I am Jack"),

                  ),
                  Container(
                    color: Colors.red,
                    child: const Text("Hello world"),
                  ),
                  const Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  )
                ],
              ),
            )));
  }
}
