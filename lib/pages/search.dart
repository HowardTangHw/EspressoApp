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

  void _updateQuery() {
    logger.i(_controller.text);
    setState(() {
      query = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: "Search Key Words",
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      labelStyle: TextStyle(
        color: _focusNode.hasFocus
            ? constants.Colors.secondary
            : constants.Colors.primary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: constants.Colors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: constants.Colors.secondary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: constants.Colors.primary),
      ),
      suffixIcon: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: _focusNode.hasFocus
                  ? constants.Colors.secondary
                  : Colors.transparent,
              shape: BoxShape.circle),
          child: GestureDetector(
              onTap: _updateQuery, child: const Icon(Icons.search))),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: IgnorePointer(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
        Colors.white.withOpacity(0.2),
        Colors.white.withOpacity(0),
        Colors.white.withOpacity(0.4)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              onSubmitted: (value) {
                logger.i(value);
                _updateQuery();
              },
              decoration: _buildInputDecoration())),
      Expanded(
          child: Stack(children: [
        if (query.isNotEmpty) FavoriteList(query: query),
        _buildGradientOverlay()
      ])),
    ]);
  }
}
