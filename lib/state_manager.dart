import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier {
  
  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
