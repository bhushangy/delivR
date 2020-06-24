import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageArea extends ChangeNotifier{
  String area = 'Yalahanka';
  void changeArea(String newArea) {
    area = newArea;
    notifyListeners();
  }
}