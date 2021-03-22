import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print("尝试 命名路由传参, 原本super方式获取的text: $text");
    print("尝试 命名路由传参, settings获取参数: $args");
    final wordPair = new WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: Text("提示"),
        ),
        body: Padding(
            padding: EdgeInsets.all(18),
            child: Center(
                child: Column(
              children: <Widget>[
                Text(text),
                new Text(wordPair.toString()),
                RaisedButton(
                    onPressed: () {
                      return Navigator.pop(context, "我是从tipRoute返回的数据");
                    },
                    child: Text("返回")),
              ],
            ))));
  }
}
