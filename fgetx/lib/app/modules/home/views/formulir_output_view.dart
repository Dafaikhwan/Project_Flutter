import 'package:fgetx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  final FormulirController c = Get.find<FormulirController>();

  FormulirOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Formulir"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data Formulir",
                    style: Theme.of(context).textTheme.titleLarge, // ✅ perbaikan
                  ),
                  const Divider(),

                  // Nama
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Nama"),
                    subtitle: Text(c.nameController.text),
                  ),

                  // Kursus
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text("Kursus"),
                    subtitle: Text(
                      c.selectedCourses.value.isNotEmpty
                          ? c.selectedCourses.value
                          : "-",
                    ),
                  ),

                  // Gender
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text("Jenis Kelamin"),
                    subtitle: Text(
                      c.gender.value.isNotEmpty ? c.gender.value : "-",
                    ),
                  ),

                  // Tanggal
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text("Tanggal Kursus"),
                    subtitle: Text(c.formattedDate),
                  ),

                  const SizedBox(height: 20),

                  // Tombol kembali
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Kembali"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
