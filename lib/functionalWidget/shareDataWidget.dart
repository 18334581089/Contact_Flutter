import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.count,
    Widget child,
  }) : super(child: child);

  final int count;

  static ShareDataWidget of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context
        .getElementForInheritedWidgetOfExactType<ShareDataWidget>()
        .widget;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.count != count;
  }
}
