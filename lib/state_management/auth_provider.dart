import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    loadAuth();
  }

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    print("loadAuth: $_isLoggedIn");
    notifyListeners();
  }

  void setAuth(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = status;
    await prefs.setBool("isLoggedIn", status);
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = false;
    await prefs.setBool("isLoggedIn", false);
    notifyListeners();
  }

  bool _isAuthenticated = false;
  String? _email;

  bool get isAuthenticated => _isAuthenticated;
  String? get email => _email;

  void getMail(bool isAuthenticated, {String? email}) {
    _isAuthenticated = isAuthenticated;
    _email = email;
    notifyListeners();
  }
}
