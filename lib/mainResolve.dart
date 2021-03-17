// 1
import 'package:flutter/material.dart';
import 'package:flutter_app_vscode/main.dart';
import 'package:flutter_app_vscode/route.dart';
// 引入包Material UI
// Material是标准的移动端和web端的视觉设计语言
// Material UI 是flutter默认提供的一套Material ui组件

// 2
void main() => runApp(MyApp());
// main函数是应用程序入口(用来启动flutter应用), 和java类似
// runApp 函数 接受一个Widget参数(Widget 树: 可以暂时理解位dom树)(Widget: 部件)
// MyApp 函数 是flutter应用的根组件

// 3
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: new MyHomePage(
          title: ('Flutter Demo Home Page'),
        ));
  }
}
// MyApp 代表了flutter应用
// statelessWidget 类 flutter中的无状态空间,没有自己的私有数据,纯展示控件
// 理解widget
// 1 flutter 大多东西都是widget,相当于组件/部件,包括对其,填充,布局都是以widget的形式展示
// 2 flutter 构建页面会调用build方法,widget的主要工作就是提供一个build方法描述如何构建ui
// 理解 MaterialApp
// 1 是Material库中提供的flutter app框架
// 2 通过它可以设置应用的名称,主题,语言,首页,路由
// 3 他自己本事也是一个widget
// home 是flutter的首页(本身也是widget)

// 4
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
// StatefulWidget 类 有状态的组件
// 状态组件区别
// 1 stateful可以拥有状态,这些状态在widget声明周期中是可以改变的,而stateless是不可以改变的
// 2 stateful至少由两个类组成,一个 StatefulWidget,另一个State

// 5
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setState: 重新执行build方法
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold: Material 页面脚手架(1 提供默认的导航栏,标题,主屏幕组件的body属性.2 创建路由.)
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // column组件: 它的子组件会竖直排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have clicked the button this many time:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
              child: Text("open new route"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 按钮组件
        onPressed: _incrementCounter, // 点击事件
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
// 注意 1
// _MyHomePageState类是MyHomePage类对应的状态类
// myhomepage的build方法挪到了_MyHomePageState中
// 将build()方法放在State中的话，构建过程不仅可以直接访问状态，而且也无需公开私有状态，这会非常方便
// 注意 2
// @override 表示 下一行的方法是从父类/接口 继承过来的，需要重写一次，方便阅读，不怕忘记
// 注意 3 
// BuildContext 是一个抽象类 用来传递数据,build方法必须传(和构建 页面的element tree有关)