import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var tip = 'this is "Text Widget", text 显示简单样式文本,包括 1 文字内容, 2 文字样式属性';

const TextSpan({
  TextStyle style,
  Sting text,
  List
})

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("base widget"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(tip),
              Text(
                "hello word",
                textAlign: TextAlign.left,
              ),
              Text(
                'hello world! i am jack ' * 4,
                maxLines: 1, // 最大行数
                overflow: TextOverflow.ellipsis, // 截断方式
              ),
              Text(
                'hello world! ',
                textScaleFactor: 1.5, // 字体大小
              ),
              Text(
                'hello world! ',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0, // 和textScaleFactor的区别:后者是缩放,并且随着系统改变
                    height: 1.2, // 行高
                    fontFamily: 'Courier',
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
            ],
          ),
        ));
  }
}
