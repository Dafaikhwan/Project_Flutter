import 'package:flutter/material.dart';
import 'package:belajar_flutter/row_column/latihan.dart';

void main() {
  runApp(Belajar_Flutter());
}

class Belajar_Flutter extends StatelessWidget {
  const Belajar_Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LatihanTiga());
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text('Belajar Flutter'),
      ),
      body: Center(
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