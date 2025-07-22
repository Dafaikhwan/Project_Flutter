import 'package:flutter/material.dart';
import 'package:belajar_flutter/main_layout.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Satu',
      body: Container(
        width: 200,
        height: 100,
        margin: const EdgeInsets.all(10),
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Ini Container Satu',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
