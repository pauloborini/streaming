import 'package:flutter/cupertino.dart';

class VideoModel extends ChangeNotifier {
  final int id;
  final String title;
  final String imageThumb;
  final String linkTrailer;
  final String linkVideo;
  final List<String> categories;

  VideoModel({
    required this.id,
    required this.title,
    required this.imageThumb,
    required this.linkTrailer,
    required this.linkVideo,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageThumb': imageThumb,
      'linkTrailer': linkTrailer,
      'linkVideo': linkVideo,
      'categories': categories,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] as int,
      title: map['title'] as String,
      imageThumb: map['imageThumb'] as String,
      linkTrailer: map['linkTrailer'] as String,
      linkVideo: map['linkVideo'] as String,
      categories: map['categories'] as List<String>,
    );
  }
}
