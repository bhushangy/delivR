import 'dart:collection';

import 'package:delivr/screens/stores/widgets/order_form_text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProvideItems extends ChangeNotifier {
  List<OrderFormTextFields> _items = [];
  List<TextEditingController> _itemList = [];
  List<String> _finalItems = [];

  UnmodifiableListView<OrderFormTextFields> get items {
    return UnmodifiableListView(_items);
  }



  int get itemCount {
    return _items.length;
  }

  void addItem(OrderFormTextFields newItem, int index) {
    if (index == 0) {
      _items.add(newItem);
    } else {
      for(int i=0;i<_itemList.length;i++){
        _finalItems.add(_itemList[i].text);
      }
      _items.clear();
      print(_finalItems);
    }
    notifyListeners();
  }

  void addToList(TextEditingController orderItem) {
    _itemList.add(orderItem);
    notifyListeners();
  }
}
