import 'package:flutter/material.dart';
import 'package:xii_rpl3/services/auth_services.dart';
import 'auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginScreen(onToggleTheme: onToggleTheme),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text("Selamat datang di halaman Home!"),
      ),
    );
  }
}
