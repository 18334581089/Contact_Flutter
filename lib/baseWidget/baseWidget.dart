import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var tip = 'this is "Text Widget", text 显示简单样式文本,包括 1 文字内容, 2 文字样式属性';

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("base widget"),
        ),
        body: Center(
          child: Column(
            children: [Text(tip)],
          ),
        ));
  }
}
