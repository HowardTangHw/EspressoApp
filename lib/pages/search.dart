import 'package:flutter/material.dart';
import 'package:espresso/util/util.dart';
import 'package:espresso/components/favorite_list.dart';
import 'package:espresso/util/constants.dart' as constants;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String query = '';
  String _printCurrentValue() {
    logger.i(_controller.text);
    setState(() {
      query = _controller.text;
    });
    return _controller.text;
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // 更新状态以刷新界面
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(children: [
          TextField(
            focusNode: _focusNode,
            // autofocus: true,
            controller: _controller,
            onSubmitted: (value) {
              logger.i(value);
              _printCurrentValue();
            },
            decoration: InputDecoration(
                labelText: "Search Key Words",
                hintText: "",
                labelStyle: TextStyle(
                  color: _focusNode.hasFocus
                      ? constants.Colors.secondary
                      : constants.Colors.primary, // 根据焦点状态设置颜色
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // 设置圆角边框的半径
                  borderSide: const BorderSide(color: constants.Colors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      color: constants.Colors.secondary), // 聚焦时的边框颜色
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      color: constants.Colors.primary), // 未选中状态边框颜色
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(8.0), // 背景颜色的内边距
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: _focusNode.hasFocus
                        ? constants.Colors.secondary
                        : Colors.transparent, // 背景颜色
                    shape: BoxShape.circle, // 设置背景为圆形
                  ),
                  child: GestureDetector(
                    child: const Icon(Icons.search),
                    onTap: () => {_printCurrentValue()},
                  ),
                )),
          ),
          Expanded(
            child: query.isNotEmpty ? FavoriteList(query: query) : Container(),
          ),
        ]));
  }
}
