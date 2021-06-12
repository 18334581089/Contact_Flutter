import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:collection';
import 'Item.dart';

/// 购物车
class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(
        0,
        (previousValue, element) =>
            previousValue + element.count * element.price,
      );

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}
