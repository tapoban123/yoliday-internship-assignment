import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int _selectedButton = 0;
  int get selectedOption => _selectedButton;

  void changeOption(int option) {
    _selectedButton = option;
    notifyListeners();
  }
}
