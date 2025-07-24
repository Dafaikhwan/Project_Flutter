import 'package:flutter/material.dart';
import 'package:belajar_flutter/main_layout.dart';

class DetailWisataScreen extends StatelessWidget {
  final String nama;
  final String kota;
  final String image;
  final String desc;

  const DetailWisataScreen({
    super.key,
    required this.nama,
    required this.kota,
    required this.image,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: nama,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Wisata
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Nama & Kota
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "$nama - $kota",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                desc,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
