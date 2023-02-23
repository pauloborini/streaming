import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../core/database/url_images/url_images.dart';
import '../models/video_model.dart';

class VideoRepository with ChangeNotifier {
  List<VideoModel> findAllVideos() {
    try {
      final videosAPi = urlData["videos"];
      return videosAPi!.map<VideoModel>((video) => VideoModel.fromMap(video)).toList();
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw Exception('Erro ao carregar os Vídeos');
    }
  }
}
