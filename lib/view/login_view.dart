import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 1. Gambar,
              // 2. Teks Judul,
              Text(
                "Notes App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // 3. Inputan Username,
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.people),
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.teal.withAlpha(50),
                  contentPadding: EdgeInsets.only(top: 13),
                ),
              ),
              // 4. Inputan Password,
              // 5. Tombol Login,
              // 6. Teks Buat Akun,
            ],
          ),
        ),
      ),
    );
  }
}
