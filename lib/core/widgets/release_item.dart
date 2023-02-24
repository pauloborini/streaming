import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';

class ReleaseItem extends StatelessWidget {
  final VideoModel video;
  final bool focus;

  const ReleaseItem({super.key, required this.video, required this.focus});

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
              child: Image.network(
                video.imageThumb,
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
