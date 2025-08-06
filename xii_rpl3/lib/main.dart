import 'package:flutter/material.dart';
import 'package:xii_rpl3/screens/auth/login_screen.dart';
import 'package:xii_rpl3/screens/home_screen.dart';
import 'package:xii_rpl3/services/auth_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService _authService = AuthService();
  late Future<bool> _isLoggedIn;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = _authService.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: FutureBuilder<bool>(
        future: _isLoggedIn,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return HomeScreen(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            );
          } else {
            return LoginScreen(
              onToggleTheme: toggleTheme,
            );
          }
        },
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
}
