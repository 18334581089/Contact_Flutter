import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class BaseWidgetForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('基础表单'),
//       ),
//       body: Center(
//         child: Column(
//           children: [

//           ],
//         ),
//       ),
//     );
//   }
// }

class TestRoute extends StatefulWidget {
  @override
  _TestRouteState createState() => new _TestRouteState();
}

class _TestRouteState extends State<TestRoute> {
  bool _seleted1 = true;
  bool _seleted2 = true;

  var inputVal = '';

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
        appBar: AppBar(
          title: Text('基础表单'),
        ),
        body: Center(
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
          ],
        )));
  }
}

TextEditingController _unameController = TextEditingController();

void initState() {
  _unameController.addListener(() {
    print('controller addListener' + _unameController.text);
  });
}
