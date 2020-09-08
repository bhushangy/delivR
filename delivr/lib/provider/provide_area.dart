import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProvideArea extends ChangeNotifier{
  String _area = 'Yalahanka';

  String get area {
    return _area;
  }

  void updateArea(String newArea) {
    _area = newArea;
    notifyListeners();
  }
}