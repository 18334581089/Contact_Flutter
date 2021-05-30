import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseScroll5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: <Widget>[
    //       ListTile(title: Text("商品列表")),
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: 100,
    //           itemExtent: 40.0,
    //           itemBuilder: (_c, int index) => Text("$index"),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    // return Scaffold(
    //   body: GridView(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       childAspectRatio: 1.0,
    //       crossAxisCount: 3,
    //     ),
    //     children: <Widget>[
    //       Icon(Icons.ac_unit),
    //       Icon(Icons.airport_shuttle),
    //       Icon(Icons.all_inclusive),
    //       Icon(Icons.beach_access),
    //       Icon(Icons.cake),
    //       Icon(Icons.free_breakfast),
    //     ],
    //   ),
    // );
    // return Scaffold(
    //   body: GridView.count(
    //     crossAxisCount: 3,
    //     childAspectRatio: 1.0,
    //     children: <Widget>[
    //       Text(
    //           'GridView.count = GridView + SliverGridDelegateWithFixedCrossAxisCount'),
    //       Text('GridView不能放在column里面'),
    //       Icon(Icons.ac_unit),
    //       Icon(Icons.airport_shuttle),
    //       Icon(Icons.all_inclusive),
    //       Icon(Icons.beach_access),
    //       Icon(Icons.cake),
    //       Icon(Icons.free_breakfast),
    //     ],
    //   ),
    // );
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0, childAspectRatio: 2.0, //宽高比为2
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
        ],
      ),
    );
  }
}

// crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
// mainAxisSpacing：主轴方向的间距。
// crossAxisSpacing：横轴方向子元素的间距。
// childAspectRatio：子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。