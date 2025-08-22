import 'package:fgetx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormulirOutputView extends StatelessWidget {
  final FormulirController c = Get.find<FormulirController>();

  FormulirOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal, // hijau
        centerTitle: true,
        title: Text(
          "Hasil Formulir",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul
                  Text(
                    "📋 Data Formulir",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal, // hijau
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(color: Colors.teal.shade200, thickness: 1),

                  const SizedBox(height: 10),

                  // Nama
                  _buildInfoTile(
                    icon: Icons.person,
                    iconColor: Colors.blue,
                    title: "Nama",
                    value: c.nameController.text,
                  ),

                  // Kursus
                  _buildInfoTile(
                    icon: Icons.book,
                    iconColor: Colors.orange,
                    title: "Kursus",
                    value: c.selectedCourses.value.isNotEmpty
                        ? c.selectedCourses.value
                        : "-",
                  ),

                  // Gender
                  _buildInfoTile(
                    icon: Icons.people,
                    iconColor: Colors.pink,
                    title: "Jenis Kelamin",
                    value: c.gender.value.isNotEmpty ? c.gender.value : "-",
                  ),

                  // Tanggal
                  _buildInfoTile(
                    icon: Icons.calendar_today,
                    iconColor: Colors.green,
                    title: "Tanggal Kursus",
                    value: c.formattedDate.isNotEmpty
                        ? c.formattedDate
                        : "-",
                  ),

                  const SizedBox(height: 30),

                  // Tombol kembali
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 30),
                        backgroundColor: Colors.teal, // hijau
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: Text(
                        "Kembali",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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

  /// Widget helper untuk menampilkan data
  Widget _buildInfoTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.15),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        subtitle: Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
