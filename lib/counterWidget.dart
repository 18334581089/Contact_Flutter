import 'dart:developer';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});
  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
    // 放: 一次性的操作
    // 状态初始化,订阅子树的事件通知
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('state 声明周期'),
    //   ),
    //   body: Center(
    //       child: Column(
    //     children: <Widget>[
    //       TextButton(
    //         child: Text('$_counter'),
    //         onPressed: () => setState(() => ++_counter),
    //       ),
    //     ],
    //   )),
    // );
    return Scaffold(
        appBar: AppBar(title: Text('获取state')),
        body: Center(
          child: Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  // 方法1

                  // ScaffoldState _state =
                  //     context.findAncestorStateOfType<ScaffoldState>();
                  // 方法2

                  ScaffoldState _state = Scaffold.of(context);

                  _state.showSnackBar(SnackBar(content: Text('SnackBar')));
                }, // 获取state1 findAncestorStateOfType
                child: Text('显示的文字'),
              );
            },
          ),
        ));

    // 构建函数
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    // 重新构建时, widget的canUpdate返回true,表示需要更新旧的节点
    // 此时会调用该函数
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
    // state对象被移除时调用
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
    // state对象从树中永久移除
    // 需要释放的资源,放在这
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
    // 开发下使用,热重载时被调用
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
    // 依赖的数据发生变化时调用(vue的prop)
  }
}

// 解释为什么把build方法放在state中
// 1 放在widget中,使用state不方便
// build(BuildContext: context, State state)
// 2 状态传递给子级时不合理
// build(context, _parentState)