import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('padding'),
      ),
      body: Wrap(
        alignment: WrapAlignment.start,
        children: <Widget>[
          Text('padding.padding'),
          Text('值是EdgeInsetsGeometry类,一般使用,EdgeInsets类,这是封装过后的'),
          Text('padding: all(16)'),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "left: 20.0",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text("symmetric(vertical:5)",
                      style: TextStyle(color: Colors.blue)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text(
                    "fromLTRB(20.0 ,0.0, 20.0, 20.0)",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
