import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_app_vscode/baseWidget/baseWidget.dart';

class BaseTransform extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('限制大小的盒子'),
      ),
      body: Column(
        children: [
          Text('倾斜skewY'),
          Container(
            color: Colors.black,
            child: new Transform(
              alignment: Alignment.topRight,
              transform: new Matrix4.skewY(0.3),
              child: new Container(
                padding: const EdgeInsets.all(8),
                color: Colors.deepOrange,
                child: const Text('apartment for rent'),
              ),
            ),
          ),
          Text('平移translate'),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: Offset(-20.0, -5.0),
              child: Text("Hello world"),
            ),
          ),
          Text('旋转rotate'),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Text("Hello world"),
            ),
          ),
          Text('缩放scale'),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(scale: 1.5, child: Text("Hello world")),
          ),
          Text('transform 的变换发生在绘制阶段,所以,还是原来的位置大小'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 0.5,
                    child: Text('这是一段文字'),
                  )),
              Text(
                '这是第二段',
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text('这是一段文字'),
                  )),
              Text(
                '这是第二段',
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
          Text('RotatedBox 和 Transform.rotate功能类似,都是旋转'),
          Text('RotatedBox: 的变化在layout,所以会影响子组件位置大小(Transform.rotate不会)'),
          Text('比较下面区别'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Text("这是一段文字"),
                ),
              ),
              Text(
                '这是第二段',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text('这是一段文字'),
                ),
              ),
              Text(
                '这是第二段',
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
          Text('Container'),
          Container(
            // margin: EdgeInsets.only(top: 50, left: 100),
            padding: EdgeInsets.only(top: 50, left: 100),
            constraints: BoxConstraints.tightFor(width: 200, height: 150),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: .98,
                colors: [Colors.red, Colors.orange],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2),
                    blurRadius: 4)
              ],
            ),
            transform: Matrix4.rotationZ(.2),
            alignment: Alignment.center,
            child: Text(
              '5.2',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ],
      ),
    );
  }
}
