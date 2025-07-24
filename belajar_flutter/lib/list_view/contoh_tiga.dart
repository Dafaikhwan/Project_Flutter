import 'package:belajar_flutter/main_layout.dart';
import 'package:flutter/material.dart';

class ListViewTiga extends StatelessWidget {
  ListViewTiga({super.key});

  final List<Color> colorList = [Colors.red, Colors.green, Colors.blue];
  final List<String> partaiList = [
    'partai banteng',
    'partai kabah',
    'partai joged',
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Contoh ListView Builder',
      body: SizedBox(
        width: double.infinity,
        height: 120, // tinggi ListView agar terlihat
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // arah scroll horizontal
          itemCount: partaiList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 120, // disamakan dengan height SizedBox
              width: 200, // lebar item agar terlihat horizontal
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorList[index % colorList.length],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  partaiList[index],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
