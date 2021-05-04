import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout3 extends StatelessWidget {
  Widget getContainer(_color) {
    return new Container(
      width: 80.0,
      height: 80.0,
      color: _color,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('wrap flow'),
        ),
        body: Column(
          children: [
            Text('Wrap'),
            Wrap(
              spacing: 10.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.end,
              runAlignment: WrapAlignment.end,
              children: <Widget>[
                new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('A')),
                    label: new Text('spacing: 10(子组件横向间距)')),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: new Text('runSpacing: 4.0(子组件纵向间距)'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: new Text('alignment, 横轴对齐'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text(
                    'runAlignment, 纵轴对齐',
                  ),
                ),
              ],
            ),
            Text('Flow'),
            Text(' delegate: 布局委托，接收一个FlowDelegate类型的值'),
            Text(' FlowDelegate: 抽象类,重写paintChildren来控制摆放'),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                getContainer(Colors.red),
                getContainer(Colors.green),
                getContainer(Colors.blue),
                getContainer(Colors.yellow),
                getContainer(Colors.brown),
                getContainer(Colors.purple),
              ],
            )
          ],
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0); //指定Flow的大小(宽度和高度)
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
