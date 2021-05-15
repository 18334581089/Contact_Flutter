import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseClip extends StatefulWidget {
  @override
  _Material createState() => _Material();
}

class MyClipper extends CustomClipper<Rect> {
  // getClip 获取剪裁区域的接口,formLTWH 参数分别是坐上坐标和宽高
  @override
  Rect getClip(Size size) => Rect.fromLTWH(30.0, 10.0, 50.0, 50.0);

  /// shouldReclip()
  ///  接口决定是否重新剪裁。
  /// 如果在应用中，剪裁区域始终不会发生变化时应该返回false，
  /// 这样就不会触发重新剪裁，避免不必要的性能开销。
  /// 如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），
  /// 那么变化后应该返回true来重新执行剪裁。
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class _Material extends State<BaseClip> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/avatar.jpg", width: 100.0);
    return Scaffold(
      appBar: AppBar(
        title: Text('clip'),
      ),
      body: Column(
        children: <Widget>[
          avatar,
          ClipOval(
            child: avatar,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text(
                '你好世界',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半，另一半会隐藏
                  child: avatar,
                ),
              ),
              Text(
                '你好世界',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          Text('不同于上面,下面是自定义剪裁区域 CustomClipper'),
          DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ))
        ],
      ),
    );
  }
}
