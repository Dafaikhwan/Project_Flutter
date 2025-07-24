import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  final String nama;
  final int points;
  final String image;
  final String bio;
  final String level;
  final String zodiak;

  const ProfileDetailScreen({
    super.key,
    required this.nama,
    required this.points,
    required this.image,
    required this.bio,
    required this.level,
    required this.zodiak,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FF),
      appBar: AppBar(
        title: const Text("Detail Profil"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Hero(
              tag: image,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 20),
            Text(nama,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text("Level $level • $zodiak", style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildInfoTile(Icons.star, "Points", "$points"),
                    buildInfoTile(Icons.military_tech, "Level", level),
                    buildInfoTile(Icons.auto_awesome, "Zodiak", zodiak),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Tentang ${nama.split(' ')[0]}",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(height: 10),
            Text(
              bio,
              style: const TextStyle(fontSize: 15, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text("$label:",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          const Spacer(),
          Text(value,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        ],
      ),
    );
  }
}
