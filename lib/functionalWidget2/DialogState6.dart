import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogRoute6 extends StatefulWidget {
  @override
  DialogRouteState6 createState() => DialogRouteState6();
}

class DialogRouteState6 extends State<DialogRoute6> {
  bool withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () async {
              int delete = await showLoadingDialog(context);
              print("点击了: $delete");
            },
          ),
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () async {
              int delete = await showLoadingDialog1(context);
              print("点击了: $delete");
            },
          ),
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () async {
              DateTime delete = await _showDatePicker1(context);
              print("点击了: $delete");
            },
          ),
        ],
      ),
    );
  }
}

showLoadingDialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

showLoadingDialog1(context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: 180,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text("正在加载，请稍后..."),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<DateTime> _showDatePicker1(context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(
      //未来30天可选
      Duration(days: 30),
    ),
  );
}
