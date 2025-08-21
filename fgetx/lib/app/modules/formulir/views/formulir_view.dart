import 'package:fgetx/app/modules/home/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormulirView'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Input nama
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown kursus
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Pilih Kursus',
                  border: OutlineInputBorder(),
                  ),
                items: controller.courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedCourses.value = value!;
                },
              ),
              const SizedBox(height: 20),

              // Pilih gender
              Obx(
                () => Column(
                  children: [
                    RadioListTile(
                      title: const Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value!;
                      },
                    ),
                    RadioListTile(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value!;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Pilih tanggal kursus
              Obx(
                () => TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Tanggal kursus',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => controller.pickDate(),
                    ),
                  ),
                  controller: TextEditingController(
                    text: controller.formattedDate,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol submit -> pindah ke output view
              ElevatedButton(
                onPressed: () {
                  Get.to(() => FormulirOutputView());
                },
                child: const Text("Kirim"),
              ),

              const SizedBox(height: 10),

              // Tombol clear form
              TextButton(
                onPressed: () => controller.clearForm(),
                child: const Text("Reset Form"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
