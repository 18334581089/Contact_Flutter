import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './EventBus.dart';

class LoginWidget2 extends StatefulWidget {
  @override
  LoginWidgetState createState() => new LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录页面')),
      body: Container(
        child: TextButton(
          child: Text("登录"),
          onPressed: () {
            //登录成功后触发登录事件，页面A中订阅者会被调用
            bus.emit("login", '段誉');
          },
        ),
      ),
    );
  }
}
