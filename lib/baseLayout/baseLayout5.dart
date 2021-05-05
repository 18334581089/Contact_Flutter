import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('对齐'),
        ),
        body: Container(
            child: Column(
          children: [
            Text('Alignment.topRight'),
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Text('Alignment(2, 0)'),
            Container(
              color: Colors.blue[50],
              child: Align(
                widthFactor: 2, // 这俩功能和上面得120一样 = 60 * 2
                heightFactor: 2, // 这俩功能和上面得120一样 = 60 * 2
                alignment: Alignment(2, 0),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Text('FractionalOffset'),
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                alignment: FractionalOffset(1, 0.5),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Text('Center (widthFactorheightFactor 默认占满)'),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text("xxx"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text("xxx"),
              ),
            )
          ],
        )));
  }
}
