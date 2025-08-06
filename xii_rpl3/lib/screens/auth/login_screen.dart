import 'package:flutter/material.dart';
import 'package:xii_rpl3/services/auth_services.dart';
import '../home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  LoginScreen({super.key, required this.onToggleTheme});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                bool success = await _authService.login(
                  emailController.text,
                  passwordController.text,
                );
                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(
                        isDarkMode: Theme.of(context).brightness == Brightness.dark,
                        onToggleTheme: onToggleTheme,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login gagal')),
                  );
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterScreen()),
              ),
              child: Text("Belum punya akun? Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
