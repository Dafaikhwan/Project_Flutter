// ignore_for_file: prefer_const_constructors

import 'package:dafa/row_column/column_satu.dart';
import 'package:dafa/row_column/latihan_dua.dart';
import 'package:dafa/row_column/latihan_satu.dart';
import 'package:dafa/row_column/latihan_tiga.dart';
import 'package:dafa/row_column/profil.dart';
import 'package:dafa/row_column/row_n_column.dart';
import 'package:dafa/row_column/row_satu.dart';
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
          title: Text(
            'Belajar Flutter',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: LatihanTiga(),
      ),
    );
  }
}

class BelajarContainer extends StatelessWidget {
  const BelajarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent.shade100,
            Colors.deepPurpleAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 4, 94, 184),       // Biru bold
              Color.fromARGB(150, 78, 11, 23),       // Maroon semi-transparan
              Color.fromARGB(255, 183, 202, 222),    // Biru keabu-abuan terang
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Hello Flutter',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
