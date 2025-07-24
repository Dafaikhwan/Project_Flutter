import 'package:flutter/material.dart';
import 'detail_wisata_screen.dart'; // pastikan file ini ada

class WisataScreen extends StatelessWidget {
  WisataScreen({super.key});

  final List<Map<String, dynamic>> wisataData = [
    {
      "nama": "Puncak Guha 1",
      "kota": "Puncak Guha",
      "image": "images/puncakguha1.jpg",
      "desc": "Puncak Guha adalah tempat wisata alam yang menawarkan keindahan tebing dan laut yang memesona.",
    },
    {
      "nama": "Puncak Guha 2",
      "kota": "Puncak Guha",
      "image": "images/puncakguha2.jpg",
      "desc": "Puncak Guha menyuguhkan panorama matahari terbenam yang sangat indah dan alami.",
    },
    {
      "nama": "Puncak Guha 3",
      "kota": "Puncak Guha",
      "image": "images/puncakguha3.jpg",
      "desc": "Puncak Guha cocok untuk relaksasi dengan suara deburan ombak dan angin laut.",
    },
    {
      "nama": "Puncak Guha 4",
      "kota": "Puncak Guha",
      "image": "images/puncakguha4.jpg",
      "desc": "Nikmati ketenangan dan pemandangan laut lepas dari tebing tinggi Puncak Guha.",
    },
    {
      "nama": "Puncak Guha 5",
      "kota": "Puncak Guha",
      "image": "images/puncakguha5.jpg",
      "desc": "Tempat terbaik untuk camping sambil menikmati panorama alam yang masih asri.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pink, Colors.orangeAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ListView.builder(
          itemCount: wisataData.length,
          itemBuilder: (context, index) {
            final data = wisataData[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailWisataScreen(
                      nama: wisataData[index]["nama"],
                      kota: wisataData[index]["kota"],
                      image: wisataData[index]["image"],
                      desc: wisataData[index]["desc"],
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                height: 200,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(data["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Text(
                    "${data["nama"]} - ${data["kota"]}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
