import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_vscode/baseWidget/baseWidget.dart';

class BaseLayout2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flex layout'),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                    child: Text('flex: 1(direction: Axis.horizontal)'),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                    child: Text('flex: 2(direction: Axis.horizontal)'),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        color: Colors.red,
                        child: Text('flex1(direction: Axis.vertical)'),
                      )),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                      child: Text('flex2(direction: Axis.vertical)'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
