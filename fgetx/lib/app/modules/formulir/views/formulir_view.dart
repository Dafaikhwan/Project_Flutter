import 'package:fgetx/app/modules/home/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal, // ubah ke hijau
        title: Text(
          'Formulir Pendaftaran',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: Colors.teal.withOpacity(0.3), // hijau
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Input nama
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    labelStyle: GoogleFonts.poppins(),
                    prefixIcon: const Icon(Icons.person, color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Dropdown kursus
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Pilih Kursus',
                    labelStyle: GoogleFonts.poppins(),
                    prefixIcon: const Icon(Icons.school, color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: controller.courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course, style: GoogleFonts.poppins()),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jenis Kelamin",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      RadioListTile(
                        title: Text('Laki-laki',
                            style: GoogleFonts.poppins(fontSize: 14)),
                        value: 'Laki-laki',
                        groupValue: controller.gender.value,
                        activeColor: Colors.teal,
                        onChanged: (value) {
                          controller.gender.value = value!;
                        },
                      ),
                      RadioListTile(
                        title: Text('Perempuan',
                            style: GoogleFonts.poppins(fontSize: 14)),
                        value: 'Perempuan',
                        groupValue: controller.gender.value,
                        activeColor: Colors.teal,
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
                      labelText: 'Tanggal Kursus',
                      labelStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today,
                            color: Colors.teal),
                        onPressed: () => controller.pickDate(),
                      ),
                    ),
                    controller: TextEditingController(
                      text: controller.formattedDate,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Tombol submit
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.teal, // hijau
                      elevation: 4,
                    ),
                    onPressed: () {
                      Get.to(() => FormulirOutputView());
                    },
                    child: Text(
                      "Kirim Formulir",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Tombol reset
                TextButton(
                  onPressed: () => controller.clearForm(),
                  child: Text(
                    "Reset Form",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
