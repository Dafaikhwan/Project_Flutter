import 'package:flutter/material.dart';

void main() {
  runApp(const BelajarFlutter());
}

class BelajarFlutter extends StatelessWidget {
  const BelajarFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Flutter',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: const Text('Belajar Flutter'),
        ),
        body: const Center(
          child: Text(
            'Halo, ini Flutter pertama saya!',
            style: TextStyle(
              backgroundColor: Colors.blueAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
