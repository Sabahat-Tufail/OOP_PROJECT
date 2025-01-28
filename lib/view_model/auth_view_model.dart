import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  bool _visibility = true;
  bool get visibility => _visibility;
  void setVisibility(bool value){
    _visibility = value;
    notifyListeners();
  }
}