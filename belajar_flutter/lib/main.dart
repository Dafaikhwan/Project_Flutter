import 'package:belajar_flutter/belajar_form/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/list_view/contoh_dua.dart';
import 'package:belajar_flutter/list_view/contoh_empat.dart';
import 'package:belajar_flutter/list_view/contoh_satu.dart';
import 'package:belajar_flutter/list_view/contoh_tiga.dart';
import 'package:belajar_flutter/list_view/profile_screen.dart';
import 'package:belajar_flutter/list_view/wisata_screen.dart';
import 'package:belajar_flutter/row_column/latihan.dart';

void main() {
  runApp(const Belajar_Flutter());
}

class Belajar_Flutter extends StatelessWidget {
  const Belajar_Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: BelajarForm(), // Ganti sesuai kebutuhan
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Belajar Flutter'),
      ),
      body: const Center(
        child: Text(
          'Hello Flutter',
          style: TextStyle(
            backgroundColor: Colors.blueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
