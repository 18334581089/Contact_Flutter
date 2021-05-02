import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('row 水平布局'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('mainAxisAlignment: 对齐方式'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('第一段文本1'),
                Text('第二段文本1'),
              ],
            ),
            Text('mainAxisSize: row宽度'),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('第一段文本2'),
                Text('第二段文本2'),
              ],
            ),
            Text('textDirection: 横向顺序'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text('第一段文本3'),
                Text('第二段文本3'),
              ],
            ),
            Text('verticalDirection: 纵向顺序, crossAxisAlignment: 纵向对齐'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(
                  '第一段文本4',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text('第二段文本4'),
              ],
            ),
          ],
        ));
  }
}
