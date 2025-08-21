import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PemesananMakananController extends GetxController {
  final namaController = TextEditingController();
  final tanggalController = TextEditingController();

  // daftar makanan dengan harga
  final List<Map<String, dynamic>> menu = [
    {"nama": "Bakso", "harga": 5000},
    {"nama": "Kopi", "harga": 15000},
  ];

  // pilihan jumlah makanan
  RxMap<String, int> pesanan = <String, int>{}.obs;

  // hitung total harga
  int get totalHarga {
    int total = 0;
    pesanan.forEach((key, value) {
      final item = menu.firstWhere((e) => e["nama"] == key);
      total += (item["harga"] as int) * value;

    });
    return total;
  }

  // hitung diskon
  double get diskon {
    if (totalHarga > 250000) {
      return 0.10;
    } else if (totalHarga > 150000) {
      return 0.05;
    }
    return 0.0;
  }

  // total setelah diskon
  double get totalBayar {
    return totalHarga - (totalHarga * diskon);
  }

  void tambahPesanan(String nama) {
    if (pesanan.containsKey(nama)) {
      pesanan[nama] = pesanan[nama]! + 1;
    } else {
      pesanan[nama] = 1;
    }
  }

  void kurangPesanan(String nama) {
    if (pesanan.containsKey(nama) && pesanan[nama]! > 0) {
      pesanan[nama] = pesanan[nama]! - 1;
      if (pesanan[nama] == 0) {
        pesanan.remove(nama);
      }
    }
  }
}
