import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScroll2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: str
              .split("")
              .map((e) => Text(
                    e,
                    textScaleFactor: 2,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
