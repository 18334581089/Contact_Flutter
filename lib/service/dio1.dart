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
      child: Center(
        child: Column(
          children: [
            Text(content1),
            Text('get'),
            Text(
                'response=await dio.get("/test",queryParameters:{"id":12,"name":"wendu"})'),
            Text('post'),
            Text(
                'response=await dio.post("/test",data:{"id":12,"name":"wendu"})'),
            Text('多个'),
            Text(
                'response= await Future.wait([dio.post("/info"),dio.get("/token")]);'),
            Text('下载'),
            Text(
                'response=await dio.download("https://www.google.com/",_savePath);'),
            Text('FormData'),
            Text(
                'FormData formData = new FormData.from({ "name": "wendux", "age": 25, })'),
            Text('response = await dio.post("/info", data: formData)'),
            Text('onHttpClientCreate  设置代理,认证,证书'),
          ],
        ),
      ),
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
