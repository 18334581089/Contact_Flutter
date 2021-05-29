// 1
import 'package:flutter/material.dart';
import 'package:flutter_app_vscode/route.dart';
import 'package:flutter_app_vscode/tipRoute.dart';
import 'package:flutter_app_vscode/counterWidget.dart';
import 'package:flutter_app_vscode/routerTestRoute.dart';
import 'package:flutter_app_vscode/statusManagement/StatusMain.dart';
import 'package:flutter_app_vscode/baseWidget/baseWidget.dart';
import 'package:flutter_app_vscode/baseWidget/baseWidgetButton.dart';
import 'package:flutter_app_vscode/baseWidget/baseWidgetImg.dart';
import 'package:flutter_app_vscode/baseWidget/baseWidgetIcon.dart';
import 'package:flutter_app_vscode/baseWidget/baseWidgetForm.dart';
import 'package:flutter_app_vscode/baseWidget/BaseForm.dart';
import 'package:flutter_app_vscode/baseWidget/BaseProgressBar.dart';
import 'package:flutter_app_vscode/baseLayout/BaseLayout1.dart';
import 'package:flutter_app_vscode/baseLayout/BaseLayout2.dart';
import 'package:flutter_app_vscode/baseLayout/BaseLayout3.dart';
import 'package:flutter_app_vscode/baseLayout/BaseLayout4.dart';
import 'package:flutter_app_vscode/baseLayout/BaseLayout5.dart';
import 'package:flutter_app_vscode/baseContainer/basePadding.dart';
import 'package:flutter_app_vscode/baseContainer/BaseConstrained.dart';
import 'package:flutter_app_vscode/baseContainer/baseTransform.dart';
import 'package:flutter_app_vscode/baseMaterial/baseMaterial1.dart';
import 'package:flutter_app_vscode/baseClip/baseClip.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll1.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll2.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll3.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll4.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll5.dart';

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
        ),
        routes: {
          "BaseScroll5": (context) => BaseScroll5(),
          "BaseScroll4": (context) => BaseScroll4(),
          "BaseScroll3": (context) => BaseScroll3(),
          "BaseScroll2": (context) => BaseScroll2(),
          "BaseScroll1": (context) => BaseScroll1(),
          "BaseClip": (context) => BaseClip(),
          "baseMaterial1": (context) => BaseMaterial1(),
          "BaseTransform": (context) => BaseTransform(),
          "BaseConstrained": (context) => BaseConstrained(),
          "BasePadding": (context) => BasePadding(),
          "BaseLayout5": (context) => BaseLayout5(),
          "BaseLayout4": (context) => BaseLayout4(),
          "BaseLayout3": (context) => BaseLayout3(),
          "BaseLayout1": (context) => BaseLayout1(),
          "BaseLayout2": (context) => BaseLayout2(),
          "BaseProgressBar": (context) => BaseProgressBar(),
          "BaseForm": (context) => BaseForm(),
          "baseWidgetForm": (context) => TestRoute(),
          "baseWidgetIcon": (context) => baseWidgetIcon(),
          "baseWidgetImg": (context) => baseWidgetImg(),
          "BaseWidgetButton": (context) => BaseWidgetButton(),
          "BaseWidget": (context) => BaseWidget(),
          "StatusMain": (context) => StatusMain(),
          "counter_widget": (context) => CounterWidget(), // 普通路由注册
          "new_page2": (context) {
            return TipRoute(text: ModalRoute.of(context).settings.arguments);
          },
          "BaseMaterial1": (context) {
            return TipRoute(text: ModalRoute.of(context).settings.arguments);
          },
          "": (context) => MyHomePage(title: 'flutter Demo Home Page')
        },
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print("出发了钩子函数, $routeName");
            return MyHomePage(title: 'flutter Demo Home Page');
          });
        });
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
      body: SingleChildScrollView(
        child: Column(
          // column组件: 它的子组件会竖直排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have clicked the button this many time:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // 体验路由push
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
              child: Text("open new route"),
            ),
            // 体验路由传参
            RouterTestRoute(),
            // state 组件
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CounterWidget();
                }));
                // Navigator.pushNamed(context, "counter_widget");
              },
              child: Text("open counter_widget"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "StatusMain");
              },
              child: Text("open StatusMain"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseWidget");
              },
              child: Text("open BaseWidget"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseWidgetButton");
              },
              child: Text("open BaseWidgetButton"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "baseWidgetImg");
              },
              child: Text("open baseWidgetImg"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "baseWidgetIcon");
              },
              child: Text("open baseWidgetIcon"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "baseWidgetForm");
              },
              child: Text("open baseWidgetForm"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseForm");
              },
              child: Text("open BaseForm"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseProgressBar");
              },
              child: Text("open BaseProgressBar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseLayout1");
              },
              child: Text("open BaseLayout1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseLayout2");
              },
              child: Text("open BaseLayout2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseLayout3");
              },
              child: Text("open BaseLayout3"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseLayout4");
              },
              child: Text("open BaseLayout4"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseLayout5");
              },
              child: Text("open BaseLayout5"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BasePadding");
              },
              child: Text("open BasePadding"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseConstrained");
              },
              child: Text("open BaseConstrained"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseTransform");
              },
              child: Text("open BaseTransform"),
            ),
            TextButton(
              onPressed: () async {
                var result = await Navigator.pushNamed(context, "baseMaterial1",
                    arguments: "命名路由传参数");
                print(result); // 还是可以异步传参的
              },
              child: Text("open baseMaterial1"),
            ),
            TextButton(
              onPressed: () async {
                var result = await Navigator.pushNamed(context, "BaseClip",
                    arguments: "命名路由传参数");
                print(result); // 还是可以异步传参的
              },
              child: Text("open BaseClip"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseScroll1");
              },
              child: Text("open BaseScroll1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseScroll2");
              },
              child: Text("open BaseScroll2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseScroll3");
              },
              child: Text("open BaseScroll3"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseScroll4");
              },
              child: Text("open BaseScroll4"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseScroll5");
              },
              child: Text("open BaseScroll5"),
            ),
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