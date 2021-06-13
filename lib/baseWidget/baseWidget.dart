import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var tip = 'this is "Text Widget", text 显示简单样式文本,包括 1 文字内容, 2 文字样式属性';

const textStyle = const TextStyle(fontFamily: 'Raleway');
// const textStyle = const TextStyle(fontFamily: 'Raleway', package: '这个参数写包名,可以引入包里的字体');

var buttonText =
    const Text("/use the font for this text,当前文字字体使用引入字体/", style: textStyle);

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
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: 'TextSpan, 可以使部分文字有部分样式'),
                TextSpan(
                    text: "http://www.baidu.com",
                    style: TextStyle(color: Colors.blue)),
              ])),
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.start,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("defaulttextstyle,部件"),
                      Text(
                        "可以让部分子元素样式不同",
                        style: TextStyle(inherit: false, color: Colors.grey),
                      )
                    ],
                  )),
              buttonText
            ],
          ),
        ));
  }
}
