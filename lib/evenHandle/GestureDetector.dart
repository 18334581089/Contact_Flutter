import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectoreTestRoute createState() => new _GestureDetectoreTestRoute();
}

class _GestureDetectoreTestRoute extends State<GestureDetectorTestRoute> {
  String _operation = "no Gesture Detected!";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.red[700]),
            ),
          ),
          onTap: () => updateText('Tap'),
          onDoubleTap: () => updateText('DoubleTap'),
          onLongPress: () => updateText('LongPress'),
        ),
      ),
    );
  }

  void updateText(String text) {
    print("当前触发的事件: $text");
    setState(() {
      _operation = text;
    });
  }
}
