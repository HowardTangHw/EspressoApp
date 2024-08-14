import 'package:flutter/material.dart';
import 'package:espresso/util/util.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  String _printCurrentValue() {
    logger.i(_controller.text);
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(children: [
          TextField(
            autofocus: true,
            controller: _controller,
            onSubmitted: (value) {
              logger.i(value);
            },
            decoration: InputDecoration(
              labelText: "Search Key Words",
              hintText: "",
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                child: const Icon(Icons.search),
                onTap: () => {_printCurrentValue()},
              ),
            ),
          )
        ]));
  }
}
