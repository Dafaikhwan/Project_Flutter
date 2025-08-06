import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xii_rpl3/models/photo_model.dart';

class PhotoService {
  static const String _photoUrl = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_photoUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => PhotoModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat foto');
    }
  }
}
