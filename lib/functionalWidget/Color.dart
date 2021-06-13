import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavBar.dart';

class MyColor extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  MyColor({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    /// 此为16进制 rgba 数值
    int _color = 0xffdc38FF;

    /// 颜色是一个字符串变量
    var _color2 = 'dc380d';

    return Material(
      child: Column(
        children: [
          Text('---'),
          Text('---'),
          Text('---'),
          Text('---'),
          Text('---'),
          Text('---'),
          Text('---'),
          Text(
            '如果已经获取到rgba格式的纯数字,直接使用Color调用就可以获得颜色',
            style: TextStyle(
              color: Color(_color),
            ),
          ),
          Text('下面是得到了6位rgb值,字符串'),
          Text('Color可能 必须使用8位16进制数字'),
          Text(
            '先把字符串 转为 ${int.parse(_color2, radix: 16)}, 然后再使用 位运算符 | 把alpha(透明度改成)FF',
            style: TextStyle(
              color: Color(int.parse(_color2, radix: 16) | 0xFF000000),
            ),
          ),
          Text(
            '先把字符串放在Color转换${int.parse(_color2, radix: 16)},直接使用Color转换${Color(int.parse(_color2, radix: 16))} 再使用Color的withAlpha方法,把alpha写成FF${Color(int.parse(_color2, radix: 16)).withAlpha(255)}',
            style: TextStyle(
              color: Color(int.parse(_color2, radix: 16)).withAlpha(255),
            ),
          ),
          NavBar(color: Colors.white, title: "标题"),
          NavBar(color: Colors.blue, title: "标题"),
        ],
      ),
    );
  }
}
