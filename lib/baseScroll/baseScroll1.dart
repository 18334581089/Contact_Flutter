import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScroll1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: str
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 2,
                    ))
                .toList(),
          ),
        )),
      ),
    );
  }
}
