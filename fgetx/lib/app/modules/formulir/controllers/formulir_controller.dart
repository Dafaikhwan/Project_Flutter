import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  final nameController = TextEditingController();

  // Pilihan kursus
  final selectedCourses = ''.obs;
  List<String> courses = [
    'Flutter',
    'Dart',
    'Java',
    'Python',
    'JavaScript',
  ];

  // Jenis kelamin
  final gender = ''.obs;

  // Tanggal
  final selectedDate = DateTime.now().obs;
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  // Ambil tanggal
  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  // Clear form
  void clearForm() {
    nameController.clear();
    selectedCourses.value = '';
    gender.value = '';
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
