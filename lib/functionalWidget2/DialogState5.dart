import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogRoute5 extends StatefulWidget {
  @override
  DialogRouteState5 createState() => DialogRouteState5();
}

class DialogRouteState5 extends State<DialogRoute5> {
  bool withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () async {
              int delete = await _showModalBottomSheet(context);
              print("点击了: $delete");
            },
          ),
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () {
              PersistentBottomSheetController delete =
                  _showBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}

// 弹出底部菜单列表模态对话框
Future<int> _showModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

// 返回的是一个controller
PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              // do something
              print("$index");
              Navigator.of(context).pop();
            },
          );
        },
      );
    },
  );
}
