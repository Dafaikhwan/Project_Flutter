import 'package:flutter/material.dart';

class LatihanTiga extends StatelessWidget {
  const LatihanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Porsche'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth < 600 ? screenWidth * 0.9 : 600,
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'porsche indonesia',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const Text(
                'porsche 911',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 62, 62, 62),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Gambar besar atas
              buildImage(
                'https://images-porsche.imgix.net/-/media/5D0BB7E042BD4C9DBEF84B5E70482520_73AA748306934B0C9CE20E32231DFCE2_CZ25W01IX0011911-carrera-front?w=999&q=85&auto=format',
                height: 160,
                radius: 20,
              ),

              const SizedBox(height: 16),

              // Dua gambar kecil sejajar
              Row(
                children: [
                  Expanded(
                    child: buildImage(
                      'https://images-porsche.imgix.net/-/media/5D0BB7E042BD4C9DBEF84B5E70482520_73AA748306934B0C9CE20E32231DFCE2_CZ25W01IX0011911-carrera-front?w=999&q=85&auto=format',
                      height: 120,
                      radius: 15,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildImage(
                      'https://images-porsche.imgix.net/-/media/5D0BB7E042BD4C9DBEF84B5E70482520_73AA748306934B0C9CE20E32231DFCE2_CZ25W01IX0011911-carrera-front?w=999&q=85&auto=format',
                      height: 120,
                      radius: 15,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Gambar besar bawah
              buildImage(
                'https://images-porsche.imgix.net/-/media/5D0BB7E042BD4C9DBEF84B5E70482520_73AA748306934B0C9CE20E32231DFCE2_CZ25W01IX0011911-carrera-front?w=999&q=85&auto=format',
                height: 160,
                radius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String url, {double height = 150, double radius = 15}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
