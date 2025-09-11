import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;

  showHidePassword() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
