import 'package:belajar_flutter/belajar_form/output_form_screen.dart';
import 'package:belajar_flutter/helpers/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final tgllahirController = TextEditingController();
  String? _jk;
  String? _agama;

  final List<String> jenisKelaminList = ['Laki-laki', 'Perempuan'];
  final List<String> agamas = [
    "Islam",
    "Kristen",
    "Katolik",
    "Hindu",
    "Buddha",
    "Khonghucu",
  ];

  @override
  void dispose() {
    nameController.dispose();
    tgllahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = displayWidth(context);
    final h = displayHeight(context);

    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: SafeArea(
        child: Center(
          child: Container(
            width: w * 0.9,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 25,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Icon(Icons.edit_note_rounded, size: 60, color: Colors.deepOrange),
                    SizedBox(height: 16),
                    Text(
                      'Form Biodata Siswa',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Divider(thickness: 1.2),
                    SizedBox(height: 28),

                    _buildTextInput(
                      label: "Nama Lengkap",
                      controller: nameController,
                      icon: Icons.person,
                      validator: (val) => val!.isEmpty ? 'Nama wajib diisi' : null,
                    ),
                    SizedBox(height: 20),

                    _buildDropdown(
                      label: "Jenis Kelamin",
                      icon: Icons.wc,
                      value: _jk,
                      items: jenisKelaminList,
                      onChanged: (val) => setState(() => _jk = val),
                      validator: (val) => val == null ? 'Pilih jenis kelamin' : null,
                    ),
                    SizedBox(height: 20),

                    _buildDatePicker(
                      label: "Tanggal Lahir",
                      controller: tgllahirController,
                      icon: Icons.date_range,
                    ),
                    SizedBox(height: 20),

                    _buildDropdown(
                      label: "Agama",
                      icon: Icons.account_balance,
                      value: _agama,
                      items: agamas,
                      onChanged: (val) => setState(() => _agama = val),
                      validator: (val) => val == null ? 'Pilih agama' : null,
                    ),
                    SizedBox(height: 36),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.send),
                        label: Text("KIRIM DATA"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                          elevation: 6,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: _submit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      items: items.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }

  Widget _buildDatePicker({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2005),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          controller.text = DateFormat('yyyy-MM-dd').format(picked);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => OutputFormScreen(
            nama: nameController.text,
            jk: _jk!,
            tglLahir: tgllahirController.text,
            agama: _agama!,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }
}
