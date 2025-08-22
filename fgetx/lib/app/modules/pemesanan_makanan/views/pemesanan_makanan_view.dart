import 'package:fgetx/app/modules/home/views/pemesanan_makanan_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/pemesanan_makanan_controller.dart';

class PemesananMakananView extends StatelessWidget {
  PemesananMakananView({super.key});
  final PemesananMakananController c = Get.put(PemesananMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: Text("🍽️ Pemesanan Makanan", style: GoogleFonts.poppins()),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Nama
            TextField(
              controller: c.namaController,
              decoration: InputDecoration(
                labelText: "Nama",
                labelStyle: GoogleFonts.poppins(),
                prefixIcon: const Icon(Icons.person, color: Colors.teal),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Tanggal
            TextField(
              controller: c.tanggalController,
              decoration: InputDecoration(
                labelText: "Tanggal",
                labelStyle: GoogleFonts.poppins(),
                prefixIcon: const Icon(Icons.calendar_today, color: Colors.teal),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              readOnly: true,
              onTap: () async => await c.pickDate(),
            ),
            const SizedBox(height: 20),

            // Menu
            Expanded(
              child: ListView.builder(
                itemCount: c.menu.length,
                itemBuilder: (context, index) {
                  final item = c.menu[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
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
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        child: Icon(item["icon"], color: Colors.teal.shade900),
                      ),
                      title: Text(item["nama"], style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      subtitle: Text(c.formatRupiah.format(item["harga"]), style: GoogleFonts.poppins()),
                      trailing: Obx(() {
                        int jumlah = c.pesanan[item["nama"]] ?? 0;
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => c.kurangPesanan(item["nama"]),
                              icon: const Icon(Icons.remove_circle, color: Colors.red),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                              child: Text(
                                "$jumlah",
                                key: ValueKey(jumlah),
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: jumlah > 0 ? Colors.teal : Colors.grey,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => c.tambahPesanan(item["nama"]),
                              icon: const Icon(Icons.add_circle, color: Colors.teal),
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            ),

            // Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.tealAccent,
                elevation: 6,
              ),
              onPressed: () {
                if (c.namaController.text.isEmpty || c.tanggalController.text.isEmpty) {
                  Get.snackbar(
                    '⚠️ Peringatan', 
                    'Nama dan tanggal harus diisi', 
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                  return;
                }
                if (c.pesanan.isEmpty) {
                  Get.snackbar(
                    '⚠️ Peringatan', 
                    'Silakan pilih makanan terlebih dahulu',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.orangeAccent,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                  return;
                }
                Get.to(() => PemesananMakananOutputView(), transition: Transition.cupertino);
              },
              child: Text("Lihat Pesanan", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
