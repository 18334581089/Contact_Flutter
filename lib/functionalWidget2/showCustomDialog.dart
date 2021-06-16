import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ElevatedButton(
          child: Text('删除'),
          onPressed: () {
            showCustomDialog1<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("您确定要删除当前文件吗?"),
                  actions: <Widget>[
                    TextButton(
                      child: Text("取消"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text("删除"),
                      onPressed: () {
                        // 执行删除操作
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Future<T> showCustomDialog1<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (
      BuildContext buildContext,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
