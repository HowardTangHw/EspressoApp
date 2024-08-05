import 'package:flutter/material.dart';
import '../util/util.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({super.key});

  @override
  ScrollControllerTestRouteState createState() {
    return ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  final ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      logger.i(_controller.offset); //打印滚动位置
      // 下面的代码移到NotificationListener里面做了
      // if (_controller.offset < 1000 && showToTopBtn) {
      //   setState(() {
      //     showToTopBtn = false;
      //   });
      // } else if (_controller.offset >= 1000 && showToTopBtn == false) {
      //   setState(() {
      //     showToTopBtn = true;
      //   });
      // }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              //重新构建
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
                showToTopBtn = progress > 10 ? true : false;
              });
              return false;
              //return true; //放开此行注释后，进度条将失效
            },
            child: Stack(alignment: Alignment.center, children: [
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                    );
                  }),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                backgroundColor: Colors.black54,
                child: Text(_progress),
              )
            ])),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(
                  .0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              }),
    );
  }
}
