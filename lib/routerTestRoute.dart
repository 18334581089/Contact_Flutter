import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tipRoute.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        // // 1
        // onPressed: () async {
        //   // 打开`TipRoute`，并等待返回结果
        //   var result = await Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) {
        //         return TipRoute(
        //           // 路由参数
        //           text: "我是提示xxxx",
        //         );
        //       },
        //     ),
        //   );
        //   // 输出`TipRoute`路由返回结果
        //   print("路由返回值: $result");
        // },
        // child: Text("没命名的路由跳转"),
        // 2 命名传参
        onPressed: () async {
          var result = await Navigator.pushNamed(context, "new_page2",
              arguments: "命名路由传参数");
          print(result); // 还是可以异步传参的
        },
        child: Text("命名传参"),
        // 3
        // // 触发钩子
        // onPressed: () {
        //   Navigator.pushNamed(context, "new_page23");
        // },
        // child: Text("触发钩子"),
      ),
    );
  }
}
