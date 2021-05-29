import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseScroll5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表")),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemExtent: 40.0,
              itemBuilder: (_c, int index) => Text("$index"),
            ),
          ),
        ],
      ),
    );
  }
}
