import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// LinearProgressIndicator({
///   double value, 进度 0-1
///   Color backgroudClor, 背景色
///   Animation<Color> valueColor, 进度条颜色(必须是动画)
/// })
///
class BaseProgressBar extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<BaseProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('progress bar!'),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              Text('进度条: (不加value属性)'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Text('进度条: 50%(加value属性'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              Text('circularProgressIndicator 圆形进度条'),
              Text('不加value属性'),
              CircularProgressIndicator(
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation(Colors.blue[900]),
              ),
              Text('加value属性'),
              CircularProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.blue,
                valueColor: AlwaysStoppedAnimation(Colors.blue[900]),
              ),
              Text('改变样式: 通过设计父盒子改变高度'),
              SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: 0.5,
                ),
              ),
              Text('改变样式: 同样通过父盒子设置,宽高不同变成椭圆'),
              SizedBox(
                height: 80,
                width: 120,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
              Text('了解: 进度条动画色 从灰色变成蓝色'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                    .animate(_animationController),
                value: _animationController.value,
              ),
            ],
          )),
    );
  }
}
