import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestRoute extends StatefulWidget {
  @override
  _TestRouteState createState() => new _TestRouteState();
}

FocusNode fn1 = new FocusNode();
FocusNode fn2 = new FocusNode();

class _TestRouteState extends State<TestRoute> {
  bool _seleted1 = true;
  bool _seleted2 = true;

  var inputVal = '';

  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    initState();

    return Scaffold(
        appBar: AppBar(
          title: Text('基础表单'),
        ),
        body: Center(
          child: Center(
              child: Column(
            children: <Widget>[
              Text(_seleted1 ? 'true' : 'false'),
              Switch(
                value: _seleted1,
                onChanged: (value) {
                  setState(() {
                    _seleted1 = value;
                  });
                },
              ),
              Text(_seleted2 ? 'true' : 'false'),
              Checkbox(
                  value: _seleted2,
                  onChanged: (val) {
                    setState(() {
                      _seleted2 = val;
                    });
                  }),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '请输入用户名或邮箱',
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入登陆密码',
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              Text('controller print' + _unameController.text),
              TextField(
                onChanged: (val) {
                  print('onChanged print' + val);
                  setState(() {
                    inputVal = val;
                  });
                },
                controller: _unameController,
              ),
              Text('控制焦点'),
              TextField(
                autofocus: true,
                focusNode: fn1,
                decoration: InputDecoration(labelText: 'input1'),
              ),
              TextField(
                  focusNode: fn2,
                  decoration: InputDecoration(labelText: 'input2')),
              ElevatedButton(
                onPressed: () {
                  if (null == focusScopeNode) {
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(fn2);
                },
                child: Text('移动焦点'),
              ),
              ElevatedButton(
                  onPressed: () {
                    fn1.unfocus();
                    fn2.unfocus();
                  },
                  child: Text('隐藏键盘(就是除去当前所有焦点)')),
              Text('decoration 修饰样式'),
              TextField(
                decoration: InputDecoration(
                    labelText: "请输入用户名",
                    prefixIcon: Icon(Icons.launch),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              Text('通过主题修改输入框样式'),
              Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.brown[900], //定义下划线颜色
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.brown), //定义label字体样式
                          hintStyle: TextStyle(
                              color: Colors.brown[800],
                              fontSize: 14.0) //定义提示文本样式
                          )),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "用户名(注意我的颜色brown)",
                            hintText: "用户名或邮箱(注意我的颜色是默认的brown)",
                            prefixIcon: Icon(Icons.person)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "密码(注意我的颜色brown)",
                            hintText: "您的登录密码(注意我的颜色被修改为blueGrey)",
                            hintStyle: TextStyle(
                                color: Colors.blueGrey[900], fontSize: 13.0)),
                        obscureText: true,
                      )
                    ],
                  )),
              Text('自定义底部边框'),
              Container(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'email',
                      hintText: 'emial2',
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200], width: 1.0))),
              )
            ],
          )),
        ));
  }
}

TextEditingController _unameController = TextEditingController();

void initState() {
  _unameController.addListener(() {
    print('controller addListener' + _unameController.text);
  });

  fn1.addListener(() {
    print(fn1.hasFocus);
  });
}
