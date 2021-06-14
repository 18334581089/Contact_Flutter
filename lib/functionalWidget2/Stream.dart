import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Stream<int> counter() {
  return Stream.periodic(
    Duration(seconds: 1),
    (i) => i,
  );
}

class MyStream extends StatefulWidget {
  @override
  MyStreamState createState() => MyStreamState();
}

class MyStreamState extends State<MyStream> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: StreamBuilder<int>(
          stream: counter(), //
          //initialData: ,// a Stream<int> or null
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }
}
