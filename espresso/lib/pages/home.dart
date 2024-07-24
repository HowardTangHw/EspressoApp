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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  fontSize: 20,
                  color: constants.Colors.primary,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationColor: Colors.blueAccent),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
                onPressed: () {
                  context.push("/app_route");
                },
                child: const Text("open new route")),
            const ProgressComponent(),
          ],
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
