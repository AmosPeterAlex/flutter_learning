import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _loogedIn = false;

  bool get login => _loogedIn;

  void loggedIn() {
    _loogedIn = true;
    notifyListeners();
  }

  void loggedOut() {
    _loogedIn = false;
    notifyListeners();
  }
}
