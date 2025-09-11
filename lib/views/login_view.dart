import 'package:aplikasi_5sib1_mobile3/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: loginController.formKey,
              child: Column(
                children: [
                  // 1. Gambar,
                  Image.asset(
                    "lib/assets/images/login.png",
                    width: 300,
                  ),
                  // 2. Teks Judul,
                  Text(
                    "Notes App",
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // 3. Inputan Username,
                  TextFormField(
                    validator: (value) => loginController.cekVailadasi(value),
                    controller: loginController.usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainer,
                      contentPadding: EdgeInsets.only(top: 13),
                    ),
                  ),
                  // 4. Inputan Password,
                  SizedBox(height: 14),
                  TextFormField(
                    validator: (value) => loginController.cekVailadasi(value),
                    controller: loginController.passwordController,
                    obscureText: loginController.isVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            loginController.showHidePassword();
                          });
                        },
                        child: Icon(
                          loginController.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainer,
                      contentPadding: EdgeInsets.only(top: 13),
                    ),
                  ),
                  // 5. Tombol Login,
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        loginController.cekLogin();
                      },
                      label: Text("Login"),
                      icon: Icon(Icons.login),
                    ),
                  ),
                  // 6. Teks Buat Akun,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Create account"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
