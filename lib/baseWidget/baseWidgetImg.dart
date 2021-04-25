import 'package:flutter/material.dart';

class baseWidgetImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/avatar.png");

    var fn1 = (e) {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(width: 100, child: e),
          ),
          Text(e.fit.toString()),
        ],
      );
    };

    var Scaffold1 = Scaffold(
      appBar: AppBar(
        title: Text("base img/icon"),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );

    var scroll1 = SingleChildScrollView(
      child: Column(
        children: [
          Image(image: AssetImage("images/avatar.png"), width: 100.0),
          Image.asset(
            // 简易写法
            "images/avatar.png",
            width: 50,
          ),
          Image(
            image: NetworkImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
            width: 100,
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 50,
          ),
          // Text('Image的参数常用的示范'), // 如果加上报错,因为 text没有fit方法(没想到解决办法)
          Image(
            image: img,
            width: 50,
            height: 100,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          Image(
            image: img,
            width: 100,
            height: 50,
            fit: BoxFit.cover,
          ),
          Image(
            image: img,
            width: 100,
            height: 50,
            fit: BoxFit.fitWidth,
          ),
          Image(
            image: img,
            width: 100,
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          Image(
            image: img,
            width: 100,
            height: 50,
            fit: BoxFit.scaleDown,
          ),
          Image(
            image: img,
            width: 50,
            height: 100,
            fit: BoxFit.none,
          ),
          Image(
            image: img,
            width: 100,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            width: 100,
            height: 200,
            repeat: ImageRepeat.repeatY,
          )
        ].map(fn1).toList(),
      ),
    );

    return scroll1;
  }
}
