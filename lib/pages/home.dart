import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/progress.dart';
import '../util/constants.dart' as constants;

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState(); // Call the superclass's initState method
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  int _counter = 0;
  final TextEditingController _unameController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                    fontSize: 20,
                    color: constants.Colors.primary,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    onPressed: () {
                      context.go("/app_route");
                    },
                    child: const Text("open new route")),
                TextButton(
                    onPressed: () {
                      context.go("/box_list");
                    },
                    child: const Text("open box list")),
                TextButton(
                    onPressed: () {
                      context.go("/position_example");
                    },
                    child: const Text("open Position")),
                TextButton(
                    onPressed: () {
                      context.go("/scollcontroller_example");
                    },
                    child: const Text("open scroll")),
                TextButton(
                    onPressed: () {
                      context.go("/custom_scroll_view");
                    },
                    child: const Text("open custom scroll")),
              ]),
              const ProgressComponent(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        " hello world ",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(" I am Jack "),
                    ],
                  ),
                ],
              ),
              Container(
                color: constants.Colors.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                    children: <Widget>[
                      Container(
                        color: constants.Colors.accent,
                        child: const Column(
                          mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                          children: <Widget>[
                            Text("hello world "),
                            Text("I am Jack "),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 100.0,
                  child: Flex(direction: Axis.vertical, children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        color: Colors.red,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        color: Colors.green,
                      ),
                    )
                  ])),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
