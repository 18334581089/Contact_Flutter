import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123'),
      ),

      /// 没有使用builder 会报错.
      /// 报错内容: Scaffold.of() called with a context that does not contain a Scaffold.
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: displaySnackbar(context),
      //     child: Text('show snackbar'),
      //   ),
      // ),
      /// 使用builder 不会报错.
      body: Builder(
        builder: (context) => Center(
          child: ElevatedButton(
            onPressed: () => displaySnackbar(context),
            child: Text('老孟'),
          ),
        ),
      ),
    );
  }
}

displaySnackbar(BuildContext context) {
  final snackBar = SnackBar(content: Text('123'));
  Scaffold.of(context).showSnackBar(snackBar);
  // ScaffoldMessenger.showSnackBar(snackBar);
}
