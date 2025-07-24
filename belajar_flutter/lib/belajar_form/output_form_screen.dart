import 'package:flutter/material.dart';

class OutputFormScreen extends StatelessWidget {
  final String nama, jk, tglLahir, agama;

  const OutputFormScreen({
    Key? key,
    required this.nama,
    required this.jk,
    required this.tglLahir,
    required this.agama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text("Hasil Form"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.deepOrange.shade100,
                  child: Icon(Icons.assignment_turned_in_rounded, size: 40, color: Colors.deepOrange),
                ),
                SizedBox(height: 16),
                Text(
                  "Data Anda",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: 1.2),
                SizedBox(height: 16),
                _buildItem("Nama Lengkap", nama),
                _buildItem("Jenis Kelamin", jk),
                _buildItem("Tanggal Lahir", tglLahir),
                _buildItem("Agama", agama),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, color: Colors.deepOrange),
          SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
