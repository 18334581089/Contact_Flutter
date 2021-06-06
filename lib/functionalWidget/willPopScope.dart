import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  _WillPopScopeTestRouteState createState() =>
      new _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop1() async {
      print(_lastPressedAt);
      if (_lastPressedAt == null ||
          DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
        _lastPressedAt = DateTime.now();
        return false;
      }
      return false;
    }

    Widget widget1 = Container(
      alignment: Alignment.center,
      child: Text('continuous pressing twice in 1 second to exit!!'),
    );

    return Scaffold(
      body: new WillPopScope(
        child: widget1,
        onWillPop: onWillPop1,
      ),
    );
  }
}
