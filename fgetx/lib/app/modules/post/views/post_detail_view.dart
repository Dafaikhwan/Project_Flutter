// ignore_for_file: prefer_const_constructors

import 'package:fgetx/app/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailView extends StatelessWidget {
  final PostModel post;

  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // sama dengan PostView & PemesananMakanan
      appBar: AppBar(
        title: Text(
          "📖 Detail Post",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.teal.shade50, Colors.teal.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Post
              Text(
                post.title ?? "No Title",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
              const SizedBox(height: 12),

              // Isi Post
              Text(
                post.body ?? "No Content",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 24),

              // User Info
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.teal.withOpacity(0.2),
                      child: Icon(Icons.person, color: Colors.teal.shade900),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "User ID: ${post.userId}",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Tombol Kembali
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    elevation: 6,
                  ),
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  label: Text(
                    "Kembali",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
