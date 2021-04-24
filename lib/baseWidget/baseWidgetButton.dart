import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("base button")),
        body: Center(
          child: Column(
            children: [
              // meterial中的所有按钮都有1:点击动画2:onPressed(不设置就是禁用状态)
              //
              // 第一个RaisedButton,漂浮按钮
              // 写上 raisedButton就会有错误提示,换成elevatedButton
              ElevatedButton(
                onPressed: () {},
                child: Text('ElevatedButton 按钮'),
              ),
              ElevatedButton(
                child: Text('没有绑定onPressed事件'),
              ),
              // 第二个FlatButton,扁平按钮
              // 写上 FlatButton就会有错误提示,换成 TextButton
              TextButton(
                onPressed: () {},
                child: Text('TextButton 按钮'),
              ),
              // 第三个OutlineButton, 带边框按钮
              // 写上 OutlineButton就会有错误提示,换成 OutlinedButton
              OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton 按钮'),
              ),
              // 第四个 IconButton, 只有图标
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up),
              ),

              // 按钮的icon属性可以写图片,给按钮加一个图标
              ElevatedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: () {},
              ),

              // 自定义外观的图标按钮
              Text("按钮都可以添加自定义外观,常见的api有: ", textAlign: TextAlign.left),
              Text("以下内容可能过时,了解即可", textAlign: TextAlign.left),
              Text("onPressed: 回调函数", textAlign: TextAlign.left),
              Text("textColor: 文字颜色", textAlign: TextAlign.left),
              Text("color: 背景颜色", textAlign: TextAlign.left),
              Text("disabledTextColor: 禁用时颜色", textAlign: TextAlign.left),
              Text("disabledColor: 禁用时背景颜色", textAlign: TextAlign.left),
              Text("highlightColor: 按下时背景颜色", textAlign: TextAlign.left),
              Text("splashColor: 按下时水波颜色", textAlign: TextAlign.left),
              Text("colorBrightness: 按钮主题", textAlign: TextAlign.left),
              Text("padding: 填充", textAlign: TextAlign.left),
              Text("shape: 外形", textAlign: TextAlign.left),

              Text(
                  "以下内容是新版的,内容参照: https://blog.csdn.net/zl18603543572/article/details/109545733"),
              TextButton(
                autofocus: true,
                onPressed: () {},
                child: Text('submit'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 18, color: Colors.red)),
                  foregroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.focused) &&
                          !states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      } else if (states.contains(MaterialState.pressed)) {
                        return Colors.blue[700];
                      }
                      return Colors.grey;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue[200];
                    }
                    return null;
                  }),
                  overlayColor: MaterialStateProperty.all(Colors.yellow),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  minimumSize: MaterialStateProperty.all(Size(200, 100)),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 1)),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
              )
            ],
          ),
        ));
  }
}
