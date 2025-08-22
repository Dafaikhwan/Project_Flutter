import 'package:fgetx/app/modules/pemesanan_makanan/controllers/pemesanan_makanan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PemesananMakananOutputView extends StatelessWidget {
  PemesananMakananOutputView({super.key});
  final PemesananMakananController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // sama dengan View utama
      appBar: AppBar(
        title: Text("📋 Ringkasan Pesanan", style: GoogleFonts.poppins()),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            c.clearForm();
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama & Tanggal
            Text("Nama: ${c.namaController.text}",
                style: GoogleFonts.poppins(
                    color: Colors.teal.shade900,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text("Tanggal: ${c.tanggalController.text}",
                style: GoogleFonts.poppins(
                    color: Colors.black87, fontSize: 16)),
            const SizedBox(height: 20),

            // Daftar Pesanan
            Text("Daftar Pesanan",
                style: GoogleFonts.poppins(
                    color: Colors.teal.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // List Pesanan
            Expanded(
              child: Obx(() {
                if (c.pesanan.isEmpty) {
                  return Center(
                    child: Text("Belum ada pesanan",
                        style: GoogleFonts.poppins(color: Colors.grey)),
                  );
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: c.pesanan.length,
                  itemBuilder: (context, index) {
                    final entry = c.pesanan.entries.toList()[index];
                    final item = c.menu.firstWhere(
                        (m) => m["nama"] == entry.key);
                    final totalItem = item["harga"] * entry.value;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: const EdgeInsets.symmetric(vertical: 6),
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
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: ListTile(
                        title: Text("${entry.key} x${entry.value}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal.shade900)),
                        trailing: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, anim) =>
                              ScaleTransition(scale: anim, child: child),
                          child: Text(
                            c.formatRupiah.format(totalItem),
                            key: ValueKey(totalItem),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            const Divider(color: Colors.grey),

            // Total Harga & Diskon
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Harga: ${c.formatRupiah.format(c.totalHarga)}",
                        style: GoogleFonts.poppins(
                            color: Colors.teal.shade900,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text("Diskon: ${(c.diskon * 100).toStringAsFixed(0)}%",
                        style: GoogleFonts.poppins(
                            color: Colors.black87, fontSize: 16)),
                  ],
                )),

            const SizedBox(height: 8),

            // Total Bayar Box
            Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade600],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.payments,
                          color: Colors.white, size: 24),
                      const SizedBox(width: 10),
                      Text(
                        c.formatRupiah.format(c.totalBayar),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
