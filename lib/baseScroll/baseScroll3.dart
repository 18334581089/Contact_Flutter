import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseScroll3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: ListView.builder(
    //         itemCount: 100,
    //         itemExtent: 40.0, //强制高度\为50.0
    //         itemBuilder: (BuildContext context, int index) {
    //           // return ListTile(title: Text("$index"));
    //           return Text("$index");
    //         }));
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.red,
    );
    return Scaffold(
      body: ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return Text("$index");
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }
}
