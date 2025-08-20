import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    if (count.value < 50) {
      count.value++;
    } else {
      Get.snackbar(
        "⚠ Warning",
        "Nilai tidak bisa lebih dari 50!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    } else {
      Get.snackbar(
        "⚠ Warning",
        "Nilai tidak bisa kurang dari 0!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
