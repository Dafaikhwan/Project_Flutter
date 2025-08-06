import 'package:flutter/material.dart';
import 'package:xii_rpl3/models/photo_model.dart';

class PhotoDetailScreen extends StatelessWidget {
  final PhotoModel photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Foto ID: ${photo.id}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: photo.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(photo.url),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                photo.title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text("Album ID: ${photo.albumId}"),
              const SizedBox(height: 5),
              Text("Photo ID: ${photo.id}"),
            ],
          ),
        ),
      ),
    );
  }
}
