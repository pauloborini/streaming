import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../generated/assets.dart';
import '../ui/styles/colors_app.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? leading;
  final AppBar appBar;
  final List<Widget>? actions;
  final ScrollController scrollController;

  final Function homeTap;
  final Function myListTap;
  final Function moviesTap;
  final Function seriesTap;

  const BaseAppBar(
      {super.key,
      this.leading,
      required this.appBar,
      this.actions,
      required this.moviesTap,
      required this.homeTap,
      required this.myListTap,
      required this.seriesTap,
      required this.scrollController});

  @override
  Size get preferredSize => const Size.fromHeight(45);

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _backgroundColorTween;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _backgroundColorTween = ColorTween(
      begin: Colors.transparent,
      end: Colors.black,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _animationController.dispose();
    widget.scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.offset >= 50 && !_animationController.isCompleted) {
      _animationController.forward();
    } else if (widget.scrollController.offset < 50 && !_animationController.isDismissed) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _backgroundColorTween,
      builder: (context, child) {
        return AppBar(
          backgroundColor: _backgroundColorTween.value,
          title: Row(
            children: [
              const SizedBox(width: 8),
              IconButton(
                  onPressed: () {},
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
                    widget.homeTap();
                  },
                  icon: const Icon(FontAwesomeIcons.house)),
              const SizedBox(width: 12),
              IconButton(
                  onPressed: () {
                    widget.myListTap();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.solidBookmark,
                  )),
              const SizedBox(width: 12),
              IconButton(
                  onPressed: () {
                    widget.moviesTap();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.clapperboard,
                  )),
              const SizedBox(width: 12),
              IconButton(
                  onPressed: () {
                    widget.seriesTap();
                  },
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
      },
    );
  }
}
