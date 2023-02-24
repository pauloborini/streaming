import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';
import 'release_item.dart';

class ReleasesWidget extends StatefulWidget {
  final Iterable<VideoModel> list;

  const ReleasesWidget({Key? key, required this.list}) : super(key: key);

  @override
  State<ReleasesWidget> createState() => _ReleasesWidgetState();
}

class _ReleasesWidgetState extends State<ReleasesWidget> {
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
            child: Text('Lançamentos', style: context.textStyles.bold),
          ),
          SizedBox(
            height: 250,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                final item = widget.list.elementAt(index);

                return InkWell(
                    onTap: () {},
                    onFocusChange: (bool isFocused) {
                      setState(() => onFocusIndex = index);
                    },
                    child: ReleaseItem(
                      video: item,
                      focus: onFocusIndex == index,
                    ));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 8, childAspectRatio: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
