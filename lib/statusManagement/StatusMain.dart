import 'package:flutter/material.dart';
import 'package:flutter_app_vscode/statusManagement/TapboxAState.dart';
import 'package:flutter_app_vscode/statusManagement/ParentWidget.dart';
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
          Text('父子 双管 状态'),
          ParentWidgetC(),
          Text('自己管状态'),
          TapboxA(),
          Text('父管状态'),
          ParentWidget(),
        ],
      )),
    );
  }
}
