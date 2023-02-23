import 'package:dpad_container/dpad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../generated/assets.dart';
import '../ui/helpers/size_extension.dart';

class BannerHighlightFront extends StatefulWidget {
  const BannerHighlightFront({super.key});

  @override
  State<BannerHighlightFront> createState() => _BannerHighlightFrontState();
}

class _BannerHighlightFrontState extends State<BannerHighlightFront> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        width: double.maxFinite,
        height: context.percentHeight(0.50),
        initialPage: 0,
        indicatorRadius: 5,
        indicatorColor: Colors.white,
        indicatorBackgroundColor: Colors.grey,
        autoPlayInterval: 6000,
        isLoop: true,
        children: [
          DpadContainer(
              onClick: () {},
              onFocus: (bool isFocused) {},
              child: const HighlightItem(image: Assets.imagesBanner1)),
          DpadContainer(
              onClick: () {},
              onFocus: (bool isFocused) {},
              child: const HighlightItem(image: Assets.imagesBanner2)),
          DpadContainer(
              onClick: () {},
              onFocus: (bool isFocused) {},
              child: const HighlightItem(image: Assets.imagesBanner3))
        ]);
  }
}

class HighlightItem extends StatelessWidget {
  final String image;

  const HighlightItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.percentHeight(0.50),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
