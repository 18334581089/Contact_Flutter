import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () {
    return "异步数据1!";
  });
}

class MyFuture extends StatefulWidget {
  @override
  MyFutureState createState() => MyFutureState();
}

class MyFutureState extends State<MyFuture> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('err');
              } else {
                return Text('success: ${snapshot.data}');
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
