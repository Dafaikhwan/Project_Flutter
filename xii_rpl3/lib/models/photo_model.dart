class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: 'https://picsum.photos/id/${json['id']}/600/400', // ganti ke picsum
      thumbnailUrl: 'https://picsum.photos/id/${json['id']}/150/150', // ganti ke picsum
    );
  }
}
