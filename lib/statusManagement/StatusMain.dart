import 'package:flutter/material.dart';
import 'package:flutter_app_vscode/statusManagement/parentWidgetC.dart';

class StatusMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("status management !!!"),
      ),
      body: Center(
          child: Column(
        children: [
          ParentWidgetC(),
        ],
      )),
    );
  }
}
