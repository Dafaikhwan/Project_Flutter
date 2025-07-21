import 'package:flutter/material.dart';

class LatihanTiga extends StatelessWidget {
  const LatihanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            '',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 117, 115, 115)),
          ),
          const SizedBox(height: 0),
          const Text(
            'davina karamoy',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://www.shutterstock.com/image-photo/martabak-manis-keju-cokelat-indonesian-260nw-515280337.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: 200,
            width: double.infinity,
          ),

          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage('https://postimg.cc/3WhXX6dB'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage('https://www.jagel.id/api/listimage/v/Martabak-Coklat-Susu-0-98261ee97595ae3e.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage('https://www.jagel.id/api/listimage/v/Martabak-Coklat-Susu-0-98261ee97595ae3e.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: 200,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}