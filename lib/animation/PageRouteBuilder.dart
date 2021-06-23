// 使用PageRouteBuilder
import 'package:flutter/material.dart';

// Navigator.push(
//   context,
//   PageRouteBuilder(
//     transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
//     pageBuilder: (BuildContext context, Animation animation,
//         Animation secondaryAnimation) {
//       return new FadeTransition(
//         //使用渐隐渐入过渡,
//         opacity: animation,
//         child: PageB(), //路由B
//       );
//     },
//   ),
// );

// 自定义路由
class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation, Widget child) {
  //    return FadeTransition(
  //      opacity: animation,
  //      child: builder(context),
  //    );
  // }
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}
// // 使用自定义路由
// Navigator.push(context, FadeRoute(builder: (context) {
//   return PageB();
// }));
