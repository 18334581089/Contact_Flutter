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
            Text('***下面是column***'),
            Text('默认占满高度: mainAxisSize: MainAxisSize.max'),
            Text(
                '宽度默认最宽子项撑开,设置居中: crossAxisAlignment: CrossAxisAlignment.center'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('第一段文本1'),
                Text('第二段文本1(比第一段长的文本)'),
              ],
            ),
            Text('下面是常用的: 让子元素位于 中间(横纵)'),
            Text(
                '1 column占满宽度double.infinity,同时用ConstrainedBox或者SizeBox限制宽度禁止修改'),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("hi"),
                  Text("world"),
                ],
              ),
            ),
            Text('使用 Center(这里不展示)'),
            Container(
              color: Colors.green[200],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      color: Colors.red[200],
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('hello world!'),
                          Text('i an jack'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
