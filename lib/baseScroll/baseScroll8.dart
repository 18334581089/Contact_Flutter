import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  _State1 createState() => new _State1();
}

class _State1 extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToToBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
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
