import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilApp());
}

class ProfilApp extends StatelessWidget {
  const ProfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/foto.png'), // Ganti dengan foto kamu
              ),
              const SizedBox(height: 16),
              const Text(
                'Dafa Ikhwan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Pelajar SMK | RPL',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Informasi
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.school, color: Colors.teal),
                      title: Text('Kelas'),
                      subtitle: Text('XI RPL 1'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.teal),
                      title: Text('Email'),
                      subtitle: Text('dafa@example.com'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text('Telepon'),
                      subtitle: Text('+62 812 3456 7890'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.teal),
                      title: Text('Alamat'),
                      subtitle: Text('Bandung, Indonesia'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
