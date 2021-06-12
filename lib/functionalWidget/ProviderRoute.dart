import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_vscode/functionalWidget/CartModel.dart';
import 'package:flutter_app_vscode/functionalWidget/Item.dart';
import 'package:flutter_app_vscode/functionalWidget/provider.dart';

import 'Consumer.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var cart = ChangeNotifierProvider.of<CartModel>(context);
                      return Text('总价: ${cart.totalPrice}');
                      // return Consumer(
                      //   builder: (context, cart) =>
                      //       Text('总价: ${cart.totalPrice}'),
                      // );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      print('ElevatedButton build');
                      return ElevatedButton(
                        child: Text('添加商品'),
                        onPressed: () {
                          /// old
                          // ChangeNotifierProvider.of<CartModel>(context).add(
                          //   Item(20.0, 1),
                          // );
                          /// new 自动更新
                          ChangeNotifierProvider.of<CartModel>(context,
                                  listen: false)
                              .add(Item(20.0, 1));
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 想把它拿出来,但是执行的时候会报错
builder2(BuildContext context) {
  print('ElevatedButton build');
  return ElevatedButton(
    child: Text('添加商品'),
    onPressed: () {
      ChangeNotifierProvider.of<CartModel>(context).add(
        Item(20.0, 1),
      );
    },
  );
}
