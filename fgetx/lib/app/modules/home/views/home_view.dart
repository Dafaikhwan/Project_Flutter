import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget _fadeSlide({
    required Widget child,
    required int delay,
  }) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 600),
      curve: Curves.easeOut,
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 30),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Widget _menuButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required String heroTag,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.white24,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.teal.shade400, Colors.teal.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(3, 5),
              )
            ],
          ),
          child: Row(
            children: [
              Hero(
                tag: heroTag,
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Home",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _fadeSlide(
                    delay: 1,
                    child: Icon(Icons.home_rounded,
                        size: 90, color: Colors.teal.shade800),
                  ),
                  const SizedBox(height: 16),
                  _fadeSlide(
                    delay: 2,
                    child: Text(
                      "Selamat Datang 👋",
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _fadeSlide(
                    delay: 3,
                    child: Text(
                      "Pilih menu yang ingin kamu akses",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.teal.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Tombol menu dengan Hero
                  _fadeSlide(
                    delay: 4,
                    child: _menuButton(
                      icon: Icons.exposure_plus_1,
                      title: "Counter",
                      heroTag: "counterIcon",
                      onTap: () => Get.toNamed('/counter',
                          arguments: {"heroTag": "counterIcon"}),
                    ),
                  ),
                  _fadeSlide(
                    delay: 5,
                    child: _menuButton(
                      icon: Icons.assignment,
                      title: "Formulir",
                      heroTag: "formulirIcon",
                      onTap: () => Get.toNamed('/formulir',
                          arguments: {"heroTag": "formulirIcon"}),
                    ),
                  ),
                  _fadeSlide(
                    delay: 6,
                    child: _menuButton(
                      icon: Icons.fastfood,
                      title: "Pemesanan Makanan",
                      heroTag: "makananIcon",
                      onTap: () => Get.toNamed('/pemesanan-makanan',
                          arguments: {"heroTag": "makananIcon"}),
                    ),
                  ),
                  _fadeSlide(
                    delay: 7,
                    child: _menuButton(
                      icon: Icons.post_add,
                      title: "Post",
                      heroTag: "postIcon",
                      onTap: () => Get.toNamed('/post',
                          arguments: {"heroTag": "postIcon"}),
                    ),
                  ),
                  _fadeSlide(
                    delay: 8,
                    child: _menuButton(
                      icon: Icons.album,
                      title: "Album",
                      heroTag: "albumIcon",
                      onTap: () => Get.toNamed('/album',
                          arguments: {"heroTag": "albumIcon"}),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
