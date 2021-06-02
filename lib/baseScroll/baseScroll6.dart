import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScroll6 extends StatefulWidget {
  @override
  _ScrollState createState() => new _ScrollState();
}

class _ScrollState extends State<BaseScroll6> {
  List<IconData> _icons = [];

  @override
  void initState() {
    _retrieveIcons();
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: gridDelegate1,
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
      ),
    );
  }
}

const gridDelegate1 = SliverGridDelegateWithFixedCrossAxisCount(
  childAspectRatio: 1.0,
  crossAxisCount: 3,
);
