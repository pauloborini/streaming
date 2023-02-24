import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';
import 'video_item.dart';

class SerieListWidget extends StatefulWidget {
  final List<VideoModel> seriesList;

  const SerieListWidget({super.key, required this.seriesList});

  @override
  State<SerieListWidget> createState() => _SerieListWidgetState();
}

class _SerieListWidgetState extends State<SerieListWidget> {
  int? onFocusIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text('Séries', style: context.textStyles.bold),
          ),
          SizedBox(
            height: 150,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.seriesList.length,
              itemBuilder: (context, index) {
                final item = widget.seriesList[index];

                return InkWell(
                    onTap: () {},
                    onFocusChange: (bool isFocused) {
                      setState(() => onFocusIndex = index);
                    },
                    child: VideoItem(
                      video: item,
                      focus: onFocusIndex == index,
                    ));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 8, childAspectRatio: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
