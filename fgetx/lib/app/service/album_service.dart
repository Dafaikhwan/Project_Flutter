import 'dart:convert';
import 'package:fgetx/app/data/models/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse("$baseUrl/albums"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data album");
    }
  }
}
