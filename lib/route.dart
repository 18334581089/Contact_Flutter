import 'package:flutter/material.dart';

// 1 当前页面创建
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

// 2 其他页面写按钮跳转
// TextButton(
//   onPressed: () {
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return NewRoute();
//     }));
//   },
//   child: Text("open new route"),
// )

// MaterialPageRoute 讲解
// 注意1 
// PageRoute 抽象类,表示占有整个屏幕得模态路由页面(可以定义切换时属性动画)
// MaterialPageRoute 继承PageRoute,时Material提供得组件(针对不同平台,实现同样得切换效果)
// android 打开新页面会从底部打开,ios打开新页面会从右侧打开
// 注意2
// materialPageRoute 的参数意义
// MaterialPageRoute({
//   WidgetBuilder builder,
//   RouteSettings settings,
//   bool maintainState = true,
//   bool fullscreenDialog = false
// })
// builder 构建页面,返回一个widget
// settings 路由的配置信息(路由名,是否初始路由)
// maintainState 跳转新路由清空之前的路由缓存
// fullscreenDialog 是否把新路由设置为弹窗(ios中设置为true页面会从底部划入)

// Navigator 讲解
// 注意1
// navigator 时一个路由管理的组件,可以打开(push)和退出(pop)路由,
// navigator管理一个栈,当前路由就是栈顶部
// push
// 方法接受俩参数(content, route),
