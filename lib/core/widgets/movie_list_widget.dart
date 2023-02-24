import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';
import 'video_item.dart';

class MovieListWidget extends StatefulWidget {
  final List<VideoModel> moviesList;

  const MovieListWidget({super.key, required this.moviesList});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
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
            child: Text('Filmes', style: context.textStyles.bold),
          ),
          SizedBox(
            height: 150,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.moviesList.length,
              itemBuilder: (context, index) {
                final item = widget.moviesList[index];

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
