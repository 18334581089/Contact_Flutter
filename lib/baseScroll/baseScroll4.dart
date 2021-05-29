import 'package:english_words/english_words.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScroll4 extends StatefulWidget {
  // State<StatefulWidget> createState() {
  //   return _BaseScroll4State();
  // }
  // State<StatefulWidget> createState() => new _BaseScroll4State();

  @override
  _BaseScroll4State createState() => new _BaseScroll4State();
}

Iterable<String> printElement() {
  return generateWordPairs().take(20).map((e) => e.asPascalCase).toList();
}

const loadingTag = "##loading##";

class _BaseScroll4State extends State<BaseScroll4> {
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  Widget loadingIcon = Container(
    padding: EdgeInsets.all(16.0),
    alignment: Alignment.center,
    child: SizedBox(
      width: 24.0,
      height: 24.0,
      child: CircularProgressIndicator(strokeWidth: 2.0),
    ),
  );

  Widget overIcon = Container(
    padding: EdgeInsets.all(16.0),
    alignment: Alignment.center,
    child: Text(
      "没有更多了",
      style: TextStyle(color: Colors.grey),
    ),
  );

  Widget itemBuilder(context, index) {
    if (_words[index] == loadingTag) {
      if (_words.length - 1 < 100) {
        _retrieveData();
        return loadingIcon;
      } else {
        //已经加载了100条数据，不再获取数据。
        return overIcon;
      }
    }
    //显示单词列表项
    return ListTile(title: Text(_words[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => Divider(
          height: 5,
          color: Colors.yellow[100],
        ),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(_words.length - 1, printElement());
      });
    });
  }
}
