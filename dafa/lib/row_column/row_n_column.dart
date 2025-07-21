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
        body: Row_N_Column(),
      ),
    );
  }
}

class Row_N_Column extends StatelessWidget {
  const Row_N_Column({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'text atas',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(
                size: 50,
                style: FlutterLogoStyle.stacked,
                textColor: Colors.pink,
              ),
              SizedBox(width: 10),
              FlutterLogo(
                size: 50,
                style: FlutterLogoStyle.stacked,
                textColor: Colors.orange,
              ),
              SizedBox(width: 10),
              FlutterLogo(
                size: 50,
                style: FlutterLogoStyle.stacked,
                textColor: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'text bawah',
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
