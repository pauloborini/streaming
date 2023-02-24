import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/assets.dart';
import '../ui/styles/colors_app.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final AppBar appBar;
  final List<Widget>? actions;

  const BaseAppBar({super.key, this.leading, required this.appBar, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white10,
      title: Row(
        children: [
          const SizedBox(width: 8),
          IconButton(
              onPressed: () {
                ///TODO
                ///scroll estilo ifood
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    color: context.colors.primary.withOpacity(0.8),
                    width: 38,
                    height: 38,
                    child: Image.asset(Assets.imagesImg, fit: BoxFit.cover)),
              )),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {
                ///TODO
                ///scroll estilo ifood
              },
              icon: const Icon(FontAwesomeIcons.house)),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.solidBookmark,
              )),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.clapperboard,
              )),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tv,
                size: 31,
              )),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.elementor,
              )),
          const SizedBox(width: 12),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
              )),
        ],
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.gear))),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
