import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _loggedIn = false;

  bool get login => _loggedIn;

  void loggedIn() {
    _loggedIn = true;
    notifyListeners();
  }

  void loggedOut() {
    _loggedIn = false;
    notifyListeners();
  }
}
