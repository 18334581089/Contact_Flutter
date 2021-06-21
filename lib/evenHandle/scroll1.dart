import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollTest extends StatefulWidget {
  @override
  ScrollTest1 createState() => new ScrollTest1();
}

class ScrollTest1 extends State<ScrollTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滚动冒泡')),
      // 增加泛型,限制notification的通知(ScrollEndNotification: 表示只接受滚动结束通知)
      body: NotificationListener<ScrollEndNotification>(
        // body: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("滚动停止");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
          }
          return true;
        },
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
        ),
      ),
    );
  }
}
