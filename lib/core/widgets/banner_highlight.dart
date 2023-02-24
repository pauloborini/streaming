import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../generated/assets.dart';
import '../ui/helpers/size_extension.dart';
import '../ui/styles/colors_app.dart';
import '../ui/styles/text_styles.dart';

class BannerHighlightFront extends StatefulWidget {
  const BannerHighlightFront({super.key});

  @override
  State<BannerHighlightFront> createState() => _BannerHighlightFrontState();
}

class _BannerHighlightFrontState extends State<BannerHighlightFront> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: context.percentHeight(0.50),
      child: Stack(
        children: [
          ImageSlideshow(
              width: double.maxFinite,
              height: context.percentHeight(0.50),
              initialPage: 0,
              indicatorRadius: 5,
              indicatorColor: Colors.white,
              indicatorBackgroundColor: Colors.grey,
              autoPlayInterval: 12000,
              isLoop: true,
              children: const [
                HighlightItem(image: Assets.imagesBanner1),
                HighlightItem(image: Assets.imagesBanner2),
                HighlightItem(image: Assets.imagesBanner3)
              ]),
          Container(
            width: double.infinity,
            height: context.percentHeight(0.50),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.2, 0),
                radius: 1.6,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
                stops: const [0.6, 1],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Paisagens', style: context.textStyles.medium),
                  ElevatedButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(context.colors.secondary),
                          backgroundColor:
                              MaterialStateProperty.all(context.colors.iconColor.withOpacity(0.8)),
                          shape: MaterialStateProperty.all(const StadiumBorder())),
                      onPressed: () {},
                      child: Text(
                        'Detalhes',
                        style: context.textStyles.bold.copyWith(color: Colors.black87),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
