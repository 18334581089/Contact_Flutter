import 'package:flutter/material.dart';
import 'dart:convert';

class DartModel extends StatefulWidget {
  @override
  DartModelState createState() => new DartModelState();
}

class DartModelState extends State<DartModel> {
  @override
  void initState() {
    super.initState();
    _updateCurve();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(children: [Text('print')]),
      ),
    );
  }

  void _updateCurve() {
    String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
    List jsonStr1 = json.decode(jsonStr);
    print(jsonStr1[0]["name"]);

    // 网络上
    var map = {"name": "zhangsan", "email": "123@qq.com", "age": 1};
    String name = json.encode(map);
    print(name);
    Map<String, dynamic> user2 = json.decode(name);
    print("姓名：${user2['name']}");
    print("邮箱：${user2['email']}");
    print("年龄：${user2['age']}");
    // 网络上

    String jsonStr2 = '{"name":"zhangsan","email":"123@qq.com","age":1}';
    // String jsonStr2 = '"{"name":"zhangsan","email":"123@qq.com","age":1}"';
    Map user = json.decode(jsonStr2);
    print('Howdy, ${user['name']}!');
    print('We sent the verification link to ${user['email']}.');

    // Json Model化
    Map userMap = json.decode(jsonStr2);
    var user3 = new User.fromJson(userMap); // 这一步生成对象可以被检验

    print('Howdy, ${user3.name}!');
    print('We sent the verification link to ${user3.email}.');
  }
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['吧'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
      };
}
