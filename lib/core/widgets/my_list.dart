import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/material.dart';

import '../../models/video_model.dart';
import '../ui/styles/text_styles.dart';
import 'video_item.dart';

class MyListWidget extends StatefulWidget {
  final List<VideoModel> myList;

  const MyListWidget({Key? key, required this.myList}) : super(key: key);

  @override
  _MyListWidgetState createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  int? onFocusIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Minha Lista', style: context.textStyles.bold),
          SizedBox(
            height: 150,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.myList.length,
              itemBuilder: (context, index) {
                final item = widget.myList[index];

                return DpadContainer(
                    onClick: () {},
                    onFocus: (bool isFocused) {
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
