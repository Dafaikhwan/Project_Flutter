import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Belajar Flutter',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const ColumnSatu(),
      ),
    );
  }
}

class ColumnSatu extends StatelessWidget {
  const ColumnSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 50,
            style: FlutterLogoStyle.stacked,
            textColor: Colors.purple,
          ),
          const SizedBox(height: 25),
          FlutterLogo(
            size: 50,
            style: FlutterLogoStyle.stacked,
            textColor: Colors.orange,
          ),
          const SizedBox(height: 25),
          FlutterLogo(
            size: 50,
            style: FlutterLogoStyle.stacked,
            textColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
