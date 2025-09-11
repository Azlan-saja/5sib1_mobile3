import 'package:flutter/material.dart';

class LoginController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();

  showHidePassword() {
    isVisible = !isVisible;
  }

  cekVailadasi(String? value) {
    if (value!.isEmpty) {
      return 'Tidak boleh kosong';
    }
    return null;
  }

  cekLogin() {
    if (formKey.currentState!.validate()) {}
  }
}
