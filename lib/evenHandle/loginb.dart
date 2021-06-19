import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './EventBus.dart';

class LoginWidget extends StatefulWidget {
  @override
  LoginWidgetState createState() => new LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  String _text = '未登录时显示的文字';

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    //监听登录事件
    bus.on("login", (arg) {
      // do something
      print(arg);
      setState(() {
        _text = arg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录页面2')),
      body: Center(
        child: Column(
          children: [
            Text(_text),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "LoginWidget2");
              },
              child: Text("open LoginWidget2"),
            ),
          ],
        ),
      ),
    );
  }
}
