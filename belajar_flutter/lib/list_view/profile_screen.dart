import 'package:flutter/material.dart';
import 'profile_detail_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, dynamic>> userList = [
    {
      "nama": "Revan",
      "points": 9999,
      "image": "images/puncakguha1.jpg",
      "bio": "Seorang petualang sejati.",
      "level": "Gold",
      "zodiak": "Aries"
    },
    {
      "nama": "Asep",
      "points": 950,
      "image": "images/puncakguha2.jpg",
      "bio": "Pecinta alam dan kopi.",
      "level": "Silver",
      "zodiak": "Taurus"
    },
    {
      "nama": "Dafa",
      "points": 1000,
      "image": "images/puncakguha3.jpg",
      "bio": "Pecinta alam dan kopi.",
      "level": "Silver",
      "zodiak": "Taurus"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Profil Pengguna")),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0E0F8), Color(0xFFF8F8FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileDetailScreen(
                      nama: user["nama"],
                      points: user["points"],
                      image: user["image"],
                      bio: user["bio"],
                      level: user["level"],
                      zodiak: user["zodiak"],
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Hero(
                        tag: user["image"],
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage(user["image"]),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user["nama"],
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text("Points: ${user["points"]}",
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
