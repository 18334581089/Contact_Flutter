import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('padding'),
      ),
      body: Wrap(
        alignment: WrapAlignment.start,
        children: <Widget>[
          Text('padding.padding'),
          Text('值是EdgeInsetsGeometry类,一般使用,EdgeInsets类,这是封装过后的'),
          Text('padding: all(16)'),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "left: 20.0",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text("symmetric(vertical:5)",
                      style: TextStyle(color: Colors.blue)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text(
                    "fromLTRB(20.0 ,0.0, 20.0, 20.0)",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          Text('ConstrainedBox.constraints 对子组件额外约束'),
          Text('constraints: BoxConstraints类用来设置限制(另外它还可以通过便捷函数设置限制'),
          Text('父元素: ConstrainedBox(minHeight: 50)'),
          Text('子元素: Container(height: 5)'),
          Text('父元素生效了'),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, // 宽度尽可能大
                minHeight: 50.0 // 最小高度为50像素
                ),
            child: Container(
                height: 5.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                )),
          )
        ],
      ),
    );
  }
}
