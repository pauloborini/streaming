import 'package:dpad_container/dpad_container.dart';
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
      title: Row(
        children: [
          const SizedBox(width: 8),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
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
          ),
          const SizedBox(width: 12),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
                onPressed: () {
                  ///TODO
                  ///scroll estilo ifood
                },
                icon: const Icon(FontAwesomeIcons.house)),
          ),
          const SizedBox(width: 12),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.solidBookmark,
                )),
          ),
          const SizedBox(width: 12),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.clapperboard,
                )),
          ),
          const SizedBox(width: 12),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.tv,
                )),
          ),
          const SizedBox(width: 12),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.elementor,
                )),
          ),
          const SizedBox(width: 24),
          DpadContainer(
            onClick: () {},
            onFocus: (bool isFocused) {},
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                )),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: DpadContainer(
              onClick: () {},
              onFocus: (bool isFocused) {},
              child: IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.gear))),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
