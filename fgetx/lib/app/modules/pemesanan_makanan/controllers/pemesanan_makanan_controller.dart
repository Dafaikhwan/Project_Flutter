import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PemesananMakananController extends GetxController {
  final namaController = TextEditingController();
  final tanggalController = TextEditingController();

  final selectedDate = DateTime.now().obs;

  final List<Map<String, dynamic>> menu = [
    {"nama": "Bakso", "harga": 5000, "icon": Icons.ramen_dining},
    {"nama": "Kopi", "harga": 15000, "icon": Icons.local_cafe},
    {"nama": "Nasi Goreng", "harga": 20000, "icon": Icons.rice_bowl},
    {"nama": "Es Teh", "harga": 5000, "icon": Icons.local_drink},
  ];

  RxMap<String, int> pesanan = <String, int>{}.obs;

  final formatRupiah = NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);

  String get formattedDate => DateFormat('dd/MM/yyyy').format(selectedDate.value);

  int get totalHarga {
    int total = 0;
    pesanan.forEach((key, value) {
      final item = menu.firstWhere((e) => e["nama"] == key);
      total += (item["harga"] as int) * value;
    });
    return total;
  }

  double get diskon {
  if (totalHarga >= 250000) return 0.10;
  if (totalHarga >= 150000) return 0.05;
  return 0.0;
}


  double get totalBayar => totalHarga - (totalHarga * diskon);

  void tambahPesanan(String nama) {
    if (pesanan.containsKey(nama)) {
      if (pesanan[nama]! < 50) {
        pesanan[nama] = pesanan[nama]! + 1;
      } else {
        Get.snackbar('⚠️ Peringatan', 'Jumlah maksimal 50', snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      pesanan[nama] = 1;
    }
  }

  void kurangPesanan(String nama) {
    if (pesanan.containsKey(nama) && pesanan[nama]! > 0) {
      pesanan[nama] = pesanan[nama]! - 1;
      if (pesanan[nama] == 0) pesanan.remove(nama);
    } else {
      Get.snackbar('⚠️ Peringatan', 'Jumlah sudah 0', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      tanggalController.text = formattedDate;
    }
  }

  void clearForm() {
    namaController.clear();
    tanggalController.clear();
    selectedDate.value = DateTime.now();
    pesanan.clear();
  }

  @override
  void onClose() {
    namaController.dispose();
    tanggalController.dispose();
    super.onClose();
  }
}
