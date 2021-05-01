import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Form({
///  @required Widget child, 子项必须是formField
///  bool autovalidate = false, 是否开启输入时自动校验
///  WillPopCallback onWillPop, 是否可以直接返回上一个路由(一个方法,返回true/false)
///  VoidCallback onChanged, 任意子项发生变化时的回调
/// })
/// FormState.validate() 手动校验
///
/// const FormField({
///  FormFieldSetter<T> onSaved, //保存回调
///  FormFieldValidator<T>  validator, //验证回调
///  T initialValue, //初始值
///  bool autovalidate = false, //是否自动校验。
///})
///
/// TextFormField 继承formFidle
/// FormState 类  form的state类
/// 获取方式:Form.of() 和 GlobalKey 获取
/// 方法：validate,save,reset

TextEditingController _unameController = new TextEditingController();
TextEditingController _pwdController = new TextEditingController();

GlobalKey _formKey = new GlobalKey<FormState>();

class BaseForm extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<BaseForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('base form'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: _form,
        ));
  }
}

Widget _form = Form(
    key: _formKey,
    child: Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          controller: _unameController,
          decoration: InputDecoration(
              labelText: 'name', hintText: 'email', icon: Icon(Icons.person)),
          validator: (v) {
            return v.trim().length > 0 ? null : 'error';
          },
        ),
        TextFormField(
          controller: _pwdController,
          decoration: InputDecoration(
              labelText: 'pwd', hintText: '密码', icon: Icon(Icons.lock)),
          validator: (v) {
            return v.trim().length > 0 ? null : 'error';
          },
        ),
        Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Row(children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                      child: Text('click(当前无法通过Form.of(context)获取form)'),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          print('ok');
                        }
                      }))
            ])),
        Expanded(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  if (Form.of(context).validate()) {
                    print('ok');
                  }
                },
                child: Text('使用 Builder 就可以用Form.of方法获取form'),
              );
            },
          ),
        )
      ],
    ));
