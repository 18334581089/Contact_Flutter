import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> showListDialog(context) async {
  int index = await showDialog(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(
            title: Text('请选择'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            ),
          )
        ],
      );
      // return Dialog(child: child);
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280),
          child: Material(
            child: child,
            type: MaterialType.card,
          ),
        ),
      );
    },
  );
  if (index != null) {
    print('点击了: $index');
  }
}

class MySimple2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ElevatedButton(
          child: Text('打开对话框'),
          onPressed: () async {
            await showListDialog(context);
          },
        ),
      ),
    );
  }
}
