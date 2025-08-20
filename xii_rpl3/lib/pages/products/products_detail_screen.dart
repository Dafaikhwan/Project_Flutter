import 'package:flutter/material.dart';
import 'package:xii_rpl3/models/products_model.dart';

class ProductsDetailScreen extends StatelessWidget {
  final Products product;

  const ProductsDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: product.id.toString(),
                child: Image.network(product.image, height: 250),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text(product.category),
              backgroundColor: Colors.teal.shade100,
            ),
            const SizedBox(height: 10),

            // ⭐ RATING BINTANG
            Row(
              children: [
                ...List.generate(5, (index) {
                  double rate = product.rating.rate;
                  return Icon(
                    index < rate
                        ? Icons.star
                        : (index < rate + 0.5 ? Icons.star_half : Icons.star_border),
                    color: Colors.amber,
                    size: 24,
                  );
                }),
                const SizedBox(width: 8),
                Text(
                  product.rating.rate.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              "Rp ${product.price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
