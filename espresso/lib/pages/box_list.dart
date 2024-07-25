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
      body: GridView.count(
        crossAxisCount: 3, // 一行显示三个
        children: List.generate(numbers.length, (index) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            width: 100,
            height: 100,
            color: getRandomColor(),
            child: Center(
              child: Text(
                numbers[index].toString(),
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
