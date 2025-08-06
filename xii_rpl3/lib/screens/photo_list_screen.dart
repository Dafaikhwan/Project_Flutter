import 'package:flutter/material.dart';
import 'package:xii_rpl3/models/photo_model.dart';
import 'package:xii_rpl3/services/photo_services.dart';
import 'photo_detail_screen.dart';

class PhotoListScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const PhotoListScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late Future<List<PhotoModel>> _photoFuture;
  List<PhotoModel> _allPhotos = [];
  String _search = '';

  @override
  void initState() {
    super.initState();
    _photoFuture = PhotoService.fetchPhotos();
  }

  List<PhotoModel> get _filteredPhotos {
    if (_search.isEmpty) return _allPhotos;
    return _allPhotos
        .where((p) => p.title.toLowerCase().contains(_search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Foto"),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: FutureBuilder<List<PhotoModel>>(
        future: _photoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          }

          _allPhotos = snapshot.data!;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari judul foto...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() => _search = value),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredPhotos.length,
                  itemBuilder: (context, index) {
                    final photo = _filteredPhotos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: ListTile(
                        leading: Hero(
                          tag: photo.id,
                          child: Image.network(
                            photo.thumbnailUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(photo.title),
                        subtitle: Text("Album ID: ${photo.albumId}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PhotoDetailScreen(photo: photo),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
