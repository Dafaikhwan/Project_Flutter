import 'package:belajar_flutter/container/dua.dart';
import 'package:belajar_flutter/main_layout.dart';
import 'package:flutter/material.dart';

class ContainerTumpuk extends StatelessWidget {
  const ContainerTumpuk({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Latihan container',
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueGrey, Colors.tealAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 2)],
        ),
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            margin: EdgeInsets.all(28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 255, 0, 0),
                  Color.fromARGB(255, 53, 2, 59)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    spreadRadius: 2)
              ],
            ),
            child: Center(
              child: ElevatedButton(
                child: Text('pindah ke Container 2'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContainerDua()),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}