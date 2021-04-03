import 'package:flutter/cupertino.dart';
import 'TapboxC.dart';

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newVlaue) {
    setState(() {
      _active = newVlaue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new TapboxC(
      active: _active,
      onChanged: _handleTapboxChanged,
    ));
  }
}
