import 'dart:math';
import 'package:flutter/material.dart';

class BoxList extends StatelessWidget {
  BoxList({super.key});

  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8];

  // 随机生成颜色的函数
  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView Example'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text('Todo'),
        ));
  }
}
