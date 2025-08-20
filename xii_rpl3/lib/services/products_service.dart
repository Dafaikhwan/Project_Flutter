import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xii_rpl3/models/products_model.dart';

class ProductsService {
  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => Products.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat produk');
    }
  }
}
