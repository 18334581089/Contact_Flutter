import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLayout4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(), // 确保占满父级
        child: Stack(
          alignment: Alignment.center, // 指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand, // 未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(
              top: 18.0,
              child: Text("定位Positioned: top:18"),
            ),
            Container(
              // child: Text("未定位widget:水平居中,垂直居中(根据父元素alignment: center)",
              child: Text("fit用于确定没有定位的子组件如何去适应Stack的大小(现在红色占满)",
                  style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("定位Positioned: left:18"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('层叠布局'),
      ),
    );
  }
}
