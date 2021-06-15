import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ElevatedButton(
          child: Text('打开对话框'),
          onPressed: () async {
            String delete = await _showDialog(context);
            if (delete == null) {
              print('null');
            } else {
              print(delete);
            }
          },
        ),
      ),
    );
  }
}

Future<String> _showDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, '选择了中文简体');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, '选择了美国英语');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });
}

// showDialog(context: context, builder: builder)