import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter');
              },
              child: const Text('Go to Counter'),
            ),
            const SizedBox(height: 16), // jarak antar tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/formulir');
              },
              child: const Text('Go to Formulir'),
            ),
            const SizedBox(height: 16), // jarak antar tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/pemesanan-makanan');
              },
              child: const Text('Go to Pemesanan Makanan'),
            ),
          ],
        ),
      ),
    );
  }
}
