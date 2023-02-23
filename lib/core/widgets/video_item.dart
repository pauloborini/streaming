import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';

class VideoItem extends StatelessWidget {
  final VideoModel video;
  final bool focus;

  const VideoItem({super.key, required this.video, required this.focus});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: focus ? Colors.blueGrey : Colors.transparent,
        border: Border.all(
          color: focus ? Colors.blueGrey : Colors.transparent,
          width: 3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                video.imageThumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          Text(
            video.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.medium.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
