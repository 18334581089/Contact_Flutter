import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio dio = Dio();

class DioRoute extends StatefulWidget {
  @override
  _DioRouteState createState() => new _DioRouteState();
}

class _DioRouteState extends State<DioRoute> {
  @override
  void initState() {
    super.initState();
    _updateCurve();
  }

  String content1;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(content1),
    );
  }

  Future _updateCurve() async {
    Response response;
    response = await dio.get("https://www.baidu.com");
    this.setState(() {
      content1 = response.data.toString();
    });
    print(response.data.toString());
  }
}
