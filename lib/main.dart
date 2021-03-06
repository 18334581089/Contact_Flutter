// 1

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter_app_vscode/CustomWidget/GradientButton.dart';
import 'package:flutter_app_vscode/CustomWidget/TurnBoxRoute.dart';
import 'package:flutter_app_vscode/CustomWidget/MyRichText.dart';
import 'package:flutter_app_vscode/CustomWidget/CustomPaintRoute.dart';
import 'package:flutter_app_vscode/CustomWidget/GradientCircularProgressRoute.dart';
import 'package:flutter_app_vscode/service/HttpTestRoute.dart';
import 'package:flutter_app_vscode/service/Dio1.dart';
import 'package:flutter_app_vscode/service/FutureBuilderRoute.dart';
import 'package:flutter_app_vscode/service/WebSocketRoute.dart';
import 'package:flutter_app_vscode/service/HttpTestRoute2.dart';
import 'package:flutter_app_vscode/service/DartModel.dart';
import 'package:flutter_app_vscode/HomeView.dart';
import 'package:flutter_app_vscode/MyImage.dart';

import 'package:camera/camera.dart';
import 'package:flutter_app_vscode/package/camera.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'internation/DemoLocalizationsDelegate.dart';
import 'internation/Localizations.dart';

// ?????????Material UI
// Material????????????????????????web????????????????????????
// Material UI ???flutter?????????????????????Material ui??????
List<CameraDescription> cameras;
// 2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  runApp(MyApp());
}
// main???????????????????????????(????????????flutter??????), ???java??????
// runApp ?????? ????????????Widget??????(Widget ???: ?????????????????????dom???)(Widget: ??????)
// MyApp ?????? ???flutter??????????????????

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
        "ImageInternalTestRoute": (context) => ImageInternalTestRoute(),
        "homeview": (context) => CustomHome(),
        "CameraExampleHome": (context) => CameraExampleHome(),
        "DartModel": (context) => DartModel(),
        "HttpTestRoute2": (context) => HttpTestRoute2(),
        "WebSocketRoute": (context) => WebSocketRoute(),
        "FutureBuilderRoute": (context) => FutureBuilderRoute(),
        "DioRoute": (context) => DioRoute(),
        "GradientCircularProgressRoute": (context) =>
            GradientCircularProgressRoute(),
        "HttpTestRoute": (context) => HttpTestRoute(),
        "CustomPaintRoute": (context) => CustomPaintRoute(),
        "MyRichTextRoute": (context) => MyRichTextRoute(),
        "TurnBoxRoute": (context) => TurnBoxRoute(),
        "GradientButton": (context) => GradientButton(),
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
        "GestureRecognizerTestRoute": (context) => GestureRecognizerTestRoute(),
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
        "counter_widget": (context) => CounterWidget(), // ??????????????????
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
          print("?????????????????????, $routeName");
          return MyHomePage(title: 'flutter Demo Home Page');
        });
      },
      // ??????????????????(?????????)
      localizationsDelegates: [
        // ?????????????????????
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('en', 'US'), // ????????????
        const Locale('zh', 'CN'), // ????????????
        //??????Locales
      ],
      // ??????????????????(?????????)
    );
  }
}
// MyApp ?????????flutter??????
// statelessWidget ??? flutter?????????????????????,???????????????????????????,???????????????
// ??????widget
// 1 flutter ??????????????????widget,???????????????/??????,????????????,??????,???????????????widget???????????????
// 2 flutter ?????????????????????build??????,widget?????????????????????????????????build????????????????????????ui
// ?????? MaterialApp
// 1 ???Material???????????????flutter app??????
// 2 ????????????????????????????????????,??????,??????,??????,??????
// 3 ???????????????????????????widget
// home ???flutter?????????(????????????widget)

// 4
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
// StatefulWidget ??? ??????????????????
// ??????????????????
// 1 stateful??????????????????,???????????????widget?????????????????????????????????,???stateless?????????????????????
// 2 stateful????????????????????????,?????? StatefulWidget,?????????State

// 5
class _MyHomePageState extends State<MyHomePage> {
  //  7/5,????????????flutter??????
  static const platform = const MethodChannel('samples.flutter.io/battery');
  // Get battery level. // 7/6,??????????????????
  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
      // batteryLevel = 'Battery level at 123 % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setState: ????????????build??????
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold: Material ???????????????(1 ????????????????????????,??????,??????????????????body??????.2 ????????????.)
      appBar: AppBar(
        // title: Text(widget.title),
        title: Text(DemoLocalizations.of(context).title), // ???????????????????????????????????????
      ),
      body: SingleChildScrollView(
        child: Column(
          // column??????: ??????????????????????????????
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have clicked the button this many time:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // ????????????push
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
              child: Text("open new route"),
            ),
            // ??????????????????
            RouterTestRoute(),
            // state ??????
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
                    arguments: "?????????????????????");
                print(result); // ???????????????????????????
              },
              child: Text("open baseMaterial1"),
            ),
            TextButton(
              onPressed: () async {
                var result = await Navigator.pushNamed(context, "BaseClip",
                    arguments: "?????????????????????");
                print(result); // ???????????????????????????
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
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "GradientButton");
              },
              child: Text("open GradientButton"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "TurnBoxRoute");
              },
              child: Text("open TurnBoxRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "MyRichTextRoute");
              },
              child: Text("open MyRichTextRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "CustomPaintRoute");
              },
              child: Text("open CustomPaintRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "GradientCircularProgressRoute");
              },
              child: Text("open GradientCircularProgressRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "HttpTestRoute");
              },
              child: Text("open HttpTestRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DioRoute");
              },
              child: Text("open DioRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "FutureBuilderRoute");
              },
              child: Text("open FutureBuilderRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "WebSocketRoute");
              },
              child: Text("open WebSocketRoute"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "HttpTestRoute2");
              },
              child: Text("open HttpTestRoute2"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "DartModel");
              },
              child: Text("open DartModel"),
            ),
            new ElevatedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "CameraExampleHome");
              },
              child: Text("open CameraExampleHome"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "homeview");
              },
              child: Text("open homeview"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "ImageInternalTestRoute");
              },
              child: Text("open ImageInternalTestRoute"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // ????????????
        onPressed: _incrementCounter, // ????????????
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
// ?????? 1
// _MyHomePageState??????MyHomePage?????????????????????
// myhomepage???build???????????????_MyHomePageState???
// ???build()????????????State???????????????????????????????????????????????????????????????????????????????????????????????????????????????
// ?????? 2
// @override ?????? ??????????????????????????????/?????? ??????????????????????????????????????????????????????????????????
// ?????? 3 
// BuildContext ?????????????????? ??????????????????,build???????????????(????????? ?????????element tree??????)