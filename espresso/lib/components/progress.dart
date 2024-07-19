import 'package:flutter/material.dart';

class ProgressComponent extends StatefulWidget {
  const ProgressComponent({super.key});

  @override
  ProgressComponentState createState() => ProgressComponentState();
}

class ProgressComponentState extends State<ProgressComponent>
    with SingleTickerProviderStateMixin {
  double value = 0;

  void _onTextChanged(String value) {
    final intValue = int.tryParse(value) ?? 0;
    if (intValue >= 0 && intValue <= 100) {
      setState(() {
        this.value = intValue / 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter value between 0 and 100',
              ),
              onChanged: _onTextChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
