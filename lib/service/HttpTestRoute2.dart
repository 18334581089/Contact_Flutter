import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpTestRoute2 extends StatefulWidget {
  @override
  _HttpTestRoute2State createState() => new _HttpTestRoute2State();
}

class _HttpTestRoute2State extends State<HttpTestRoute2> {
  String _text = "";

  _request() async {
    //建立连接
    var socket = await Socket.connect("baidu.com", 80);
    //根据http协议，发送请求头
    socket.writeln("GET / HTTP/1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:close");
    socket.writeln();
    await socket.flush(); //发送
    //读取返回内容
    this.setState(() {
      // _text = await socket.transform(utf8.decoder).join();
      print(socket);
      _text = '123';
    });
    await socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextButton(
                onPressed: _request,
                child: Text("click"),
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  child: Text(_text.replaceAll(new RegExp(r"\s"), "")))
            ],
          ),
        ),
      ),
    );
  }
}
