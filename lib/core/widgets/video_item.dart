import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../models/video_model.dart';
import '../ui/helpers/size_extension.dart';
import '../ui/styles/text_styles.dart';

class VideoItem extends StatelessWidget {
  final VideoModel video;
  final bool focus;

  const VideoItem({super.key, required this.video, required this.focus});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FadeInImage.assetNetwork(
                image: video.imageThumb,
                placeholder: Assets.imagesLoading,
                width: context.percentWidth(0.2),
                fit: BoxFit.cover,
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
      ),
    );
  }
}
