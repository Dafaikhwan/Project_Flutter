import 'package:fgetx/app/modules/home/views/pemesanan_makanan_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pemesanan_makanan_controller.dart';

class PemesananMakananView extends StatelessWidget {
  PemesananMakananView({super.key});
  final PemesananMakananController c = Get.put(PemesananMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pemesanan Makanan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: c.namaController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: c.tanggalController,
              decoration: const InputDecoration(labelText: "Tanggal"),
              readOnly: true,
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                );
                if (picked != null) {
                  c.tanggalController.text = picked.toIso8601String().split("T").first;
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: c.menu.length,
                itemBuilder: (context, index) {
                  final item = c.menu[index];
                  return Card(
                    child: ListTile(
                      title: Text("${item["nama"]} - Rp${item["harga"]}"),
                      trailing: Obx(() => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => c.kurangPesanan(item["nama"]),
                                icon: const Icon(Icons.remove),
                              ),
                              Text("${c.pesanan[item["nama"]] ?? 0}"),
                              IconButton(
                                onPressed: () => c.tambahPesanan(item["nama"]),
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PemesananMakananOutputView());
              },
              child: const Text("Lihat Pesanan"),
            )
          ],
        ),
      ),
    );
  }
}
