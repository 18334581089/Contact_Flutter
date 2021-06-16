import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

Future<bool> showDeleteConfirmDialog4(BuildContext context) {
  bool _withTree = false; //记录复选框是否选中
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                StatefulBuilder(
                  builder: (context, _setState) {
                    return Checkbox(
                      value: _withTree, //默认不选中
                      onChanged: (bool value) {
                        //_setState方法实际就是该StatefulWidget的setState方法，
                        //调用后builder方法会重新被调用
                        _setState(() {
                          //更新选中状态
                          _withTree = !_withTree;
                        });
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

class DialogRoute3 extends StatefulWidget {
  @override
  DialogRouteState3 createState() => DialogRouteState3();
}

class DialogRouteState3 extends State<DialogRoute3> {
  bool withTree = false; // 复选框选中状态

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("对话框2"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog4(context);
              if (delete == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $delete");
              }
            },
          ),
        ],
      ),
    );
  }
}
