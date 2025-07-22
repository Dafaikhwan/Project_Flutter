import 'package:belajar_flutter/container/satu.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/main_layout.dart';

class ContainerDua extends StatelessWidget {
  const ContainerDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container 2',
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // ✅ koma ditambahkan di sini
          gradient: const LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.blueGrey,
              Colors.tealAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContainerSatu()),
              );
            },
            child: const Text('Pindah ke Container 1'),
          ),
        ),
      ),
    );
  }
}
