import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _tabNumber = 0;
  int get tabNumber => _tabNumber;

  void changeTab(int tab) {
    _tabNumber = tab;
    notifyListeners();
  }
}
