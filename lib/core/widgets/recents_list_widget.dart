import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';
import 'video_item.dart';

class RecentsListWidget extends StatefulWidget {
  final List<VideoModel> recentList;
  final ValueNotifier<bool> loaded;

  const RecentsListWidget({super.key, required this.recentList, required this.loaded});

  @override
  State<RecentsListWidget> createState() => _RecentsListWidgetState();
}

class _RecentsListWidgetState extends State<RecentsListWidget> {
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
            child: Text('Continue Assistindo', style: context.textStyles.bold),
          ),
          SizedBox(
            height: 150,
            child: ValueListenableBuilder(
                valueListenable: widget.loaded,
                builder: (context, bool isLoaded, child) {
                  return (isLoaded)
                      ? GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.recentList.length,
                          itemBuilder: (context, index) {
                            final item = widget.recentList[index];

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
                        )
                      : const CircularProgressIndicator.adaptive();
                }),
          ),
        ],
      ),
    );
  }
}
