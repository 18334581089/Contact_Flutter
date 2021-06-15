import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ElevatedButton(
          child: Text('打开对话框'),
          onPressed: () async {
            bool delete = await showDeleteConfirmDialog1(context);
            if (delete == null) {
              print('取消删除');
            } else {
              print('已确认删除');
            }
          },
        ),
      ),
    );
  }
}

Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text('你确定要删除当前文件么?'),
        actions: [
          TextButton(
            onPressed: () {
              return Navigator.of(context).pop();
            },
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () {
              return Navigator.of(context).pop(true);
            },
            child: Text('确认'),
          ),
        ],
      );
    },
  );
}
