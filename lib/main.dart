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
import 'package:flutter_app_vscode/baseScroll/baseScroll6.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll7.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll8.dart';
import 'package:flutter_app_vscode/baseScroll/baseScroll9.dart';
import 'package:flutter_app_vscode/functionalWidget/willPopScope.dart';
import 'package:flutter_app_vscode/functionalWidget/inheritedWidgetTestRoute.dart';
import 'package:flutter_app_vscode/functionalWidget/Builder.dart';
import 'package:flutter_app_vscode/functionalWidget/ProviderRoute.dart';
import 'package:flutter_app_vscode/functionalWidget/Color.dart';
import 'package:flutter_app_vscode/functionalWidget/ThemeTestRoute.dart';
import 'package:flutter_app_vscode/functionalWidget2/Future.dart';
import 'package:flutter_app_vscode/functionalWidget2/Stream.dart';
import 'package:flutter_app_vscode/functionalWidget2/Dialog.dart';
import 'package:flutter_app_vscode/functionalWidget2/SimPleDialog.dart';
import 'package:flutter_app_vscode/functionalWidget2/Dialog2.dart';
import 'package:flutter_app_vscode/functionalWidget2/ShowCustomDialog.dart';
import 'package:flutter_app_vscode/functionalWidget2/DialogState.dart';
import 'package:flutter_app_vscode/functionalWidget2/DialogState2.dart';
import 'package:flutter_app_vscode/functionalWidget2/DialogState3.dart';
import 'package:flutter_app_vscode/functionalWidget2/DialogState4.dart';
import 'package:flutter_app_vscode/functionalWidget2/DialogState5.dart';
import 'package:flutter_app_vscode/functionalWidget2/DialogState6.dart';
import 'package:flutter_app_vscode/evenHandle/Listener.dart';
import 'package:flutter_app_vscode/evenHandle/GestureDetector.dart';
import 'package:flutter_app_vscode/evenHandle/GestureDetector2.dart';
import 'package:flutter_app_vscode/evenHandle/ScaleTestRoute.dart';
import 'package:flutter_app_vscode/evenHandle/GestureRecognizer.dart';
import 'package:flutter_app_vscode/evenHandle/BothDirectionTestRoute.dart';
import 'package:flutter_app_vscode/evenHandle/loginb.dart';
import 'package:flutter_app_vscode/evenHandle/login.dart';
import 'package:flutter_app_vscode/evenHandle/scroll1.dart';
import 'package:flutter_app_vscode/evenHandle/MyNotification.dart';
import 'package:flutter_app_vscode/animation/animation.dart';
import 'package:flutter_app_vscode/animation/animation2.dart';
import 'package:flutter_app_vscode/animation/animation3.dart';
import 'package:flutter_app_vscode/animation/heroRouteA.dart';
import 'package:flutter_app_vscode/animation/heroRouteB.dart';
import 'package:flutter_app_vscode/animation/StaggerRoute.dart';
import 'package:flutter_app_vscode/animation/AnimatedSwitcherCounterRoute.dart';
import 'package:flutter_app_vscode/animation/MySlideTransition.dart';
import 'package:flutter_app_vscode/animation/AnimatedDecoratedBox1.dart';
import 'package:flutter_app_vscode/animation/AnimatedWidgetsTest.dart';

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
          "AnimatedWidgetsTest": (context) => AnimatedWidgetsTest(),
          "AnimatedDecoratedBox1": (context) => TestBox(),
          "AnimatedSwitcherCounterRoute": (context) =>
              AnimatedSwitcherCounterRoute(),
          "MySlideTransition2": (context) => MySlideTransition2(),
          "StaggerRoute": (context) => StaggerRoute(),
          "heroRouteA": (context) => HeroAnimationRoute(),
          "heroRouteB": (context) => HeroAnimationRouteB(),
          "ScaleAnimationRoute2": (context) => ScaleAnimationRoute2(),
          "ScaleAnimationRoute1": (context) => ScaleAnimationRoute1(),
          "ScaleAnimationRoute": (context) => ScaleAnimationRoute(),
          "NotificationRoute": (context) => NotificationRoute(),
          "ScrollTest": (context) => ScrollTest(),
          "LoginWidget2": (context) => LoginWidget2(),
          "LoginWidget": (context) => LoginWidget(),
          "BothDirectionTestRoute": (context) => BothDirectionTestRoute(),
          "GestureRecognizerTestRoute": (context) =>
              GestureRecognizerTestRoute(),
          "ScaleTestRoute": (context) => ScaleTestRoute(),
          "_Drag": (context) => Drag1(),
          "GestureDetector": (context) => GestureDetectorTestRoute(),
          "Listener": (context) => Listener1(),
          "DialogState6": (context) => DialogRoute6(),
          "DialogState5": (context) => DialogRoute5(),
          "DialogRoute4": (context) => DialogRoute4(),
          "DialogRoute3": (context) => DialogRoute3(),
          "DialogRoute2": (context) => DialogRoute2(),
          "DialogRoute": (context) => DialogRoute1(),
          "ShowCustomDialog": (context) => ShowCustomDialog(),
          "Dialog2": (context) => MySimple2(),
          "SimPle": (context) => MySimple(),
          "MyDialog": (context) => MyDialog(),
          "MyStream": (context) => MyStream(),
          "MyFuture": (context) => MyFuture(),
          "Theme": (context) => ThemeTestRoute(),
          "MyColor": (context) => MyColor(),
          "ProviderRoute": (context) => ProviderRoute(),
          "HomePage": (context) => HomePage(),
          "InheritedWidgetTestRoute": (context) => InheritedWidgetTestRoute(),
          "ScrollNotificationTestRoute": (context) =>
              ScrollNotificationTestRoute(),
          "WillPopScopeTestRoute": (context) => WillPopScopeTestRoute(),
          "ScrollControllerTestRoute": (context) => ScrollControllerTestRoute(),
          "CustomScrollViewTestRoute": (context) => CustomScrollViewTestRoute(),
          "BaseScroll6": (context) => BaseScroll6(),
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
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BaseScroll6");
              },
              child: Text("open BaseScroll6"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "CustomScrollViewTestRoute");
              },
              child: Text("open CustomScrollViewTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScrollControllerTestRoute");
              },
              child: Text("open ScrollControllerTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScrollNotificationTestRoute");
              },
              child: Text("open ScrollNotificationTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "WillPopScopeTestRoute");
              },
              child: Text("open WillPopScopeTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "InheritedWidgetTestRoute");
              },
              child: Text("open InheritedWidgetTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "HomePage");
              },
              child: Text("open HomePage"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ProviderRoute");
              },
              child: Text("open ProviderRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "MyColor");
              },
              child: Text("open MyColor"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Theme");
              },
              child: Text("open Theme"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "MyFuture");
              },
              child: Text("open MyFuture"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "MyStream");
              },
              child: Text("open MyStream"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "MyDialog");
              },
              child: Text("open MyDialog"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "SimPle");
              },
              child: Text("open SimPle"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Dialog2");
              },
              child: Text("open Dialog2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ShowCustomDialog");
              },
              child: Text("open ShowCustomDialog"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DialogRoute");
              },
              child: Text("open DialogRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DialogRoute2");
              },
              child: Text("open DialogRoute2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DialogRoute3");
              },
              child: Text("open DialogRoute3"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DialogRoute4");
              },
              child: Text("open DialogRoute4"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DialogState5");
              },
              child: Text("open DialogState5"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DialogState6");
              },
              child: Text("open DialogState6"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Listener");
              },
              child: Text("open Listener"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "GestureDetector");
              },
              child: Text("open GestureDetector"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "_Drag");
              },
              child: Text("open _Drag"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScaleTestRoute");
              },
              child: Text("open ScaleTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "GestureRecognizerTestRoute");
              },
              child: Text("open GestureRecognizerTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "BothDirectionTestRoute");
              },
              child: Text("open BothDirectionTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "LoginWidget");
              },
              child: Text("open LoginWidget"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScrollTest");
              },
              child: Text("open ScrollTest"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "NotificationRoute");
              },
              child: Text("open NotificationRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScaleAnimationRoute");
              },
              child: Text("open ScaleAnimationRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScaleAnimationRoute1");
              },
              child: Text("open ScaleAnimationRoute1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScaleAnimationRoute2");
              },
              child: Text("open ScaleAnimationRoute2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ScaleAnimationRoute2");
              },
              child: Text("open ScaleAnimationRoute2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "heroRouteA");
              },
              child: Text("open heroRouteA"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "heroRouteB");
              },
              child: Text("open heroRouteB"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "StaggerRoute");
              },
              child: Text("open StaggerRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "AnimatedSwitcherCounterRoute");
              },
              child: Text("open AnimatedSwitcherCounterRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "MySlideTransition2");
              },
              child: Text("open MySlideTransition2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "AnimatedDecoratedBox1");
              },
              child: Text("open AnimatedDecoratedBox1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "AnimatedWidgetsTest");
              },
              child: Text("open AnimatedWidgetsTest"),
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