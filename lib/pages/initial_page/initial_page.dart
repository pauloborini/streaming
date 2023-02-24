import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/ui/helpers/size_extension.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/widgets/banner_highlight.dart';
import '../../core/widgets/base_appbar.dart';
import '../../core/widgets/movie_banner.dart';
import '../../core/widgets/movie_list_widget.dart';
import '../../core/widgets/my_list_widget.dart';
import '../../core/widgets/recents_list_widget.dart';
import '../../core/widgets/release_list_widget.dart';
import '../../core/widgets/serie_list_widget.dart';
import '../../models/video_model.dart';
import '../../repositories/video_repository.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final _scrollController = ScrollController();

  final homeListKey = GlobalKey();
  final myListKey = GlobalKey();
  final moviesListKey = GlobalKey();
  final seriesListKey = GlobalKey();

  ValueNotifier<bool> loaded = ValueNotifier(false);
  late List<VideoModel> myList;
  late List<VideoModel> recentList;
  late List<VideoModel> series;
  late List<VideoModel> movies;

  readData() async {
    loaded.value = false;
    myList = Provider.of<VideoRepository>(context).findAllVideos();
    recentList = [...myList.sublist(4, 11)];
    series = [...myList.sublist(0, 8)];
    movies = [...myList.sublist(9, 16)];
    loaded.value = true;
  }

  void scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(context.screenWidth);
    readData();
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        homeTap: () => scrollToKey(homeListKey),
        myListTap: () => scrollToKey(myListKey),
        moviesTap: () => scrollToKey(moviesListKey),
        seriesTap: () => scrollToKey(seriesListKey),
        scrollController: _scrollController,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
              child: SizedBox(
                  child: Column(
            children: [
              KeyedSubtree(key: homeListKey, child: const BannerHighlightFront()),
              KeyedSubtree(key: myListKey, child: const SizedBox(height: 6)),
              RecentsListWidget(recentList: recentList, loaded: loaded,),
              const SizedBox(height: 6),
              Divider(thickness: 0.2, indent: 100, color: context.colors.iconColor, endIndent: 100),
              MyListWidget(myList: myList, loaded: loaded,),
              const SizedBox(height: 6),
              const MovieBanner(),
              const SizedBox(height: 6),
              ReleaseListWidget(list: movies.reversed),
              KeyedSubtree(key: moviesListKey, child: const SizedBox(height: 6)),
              Divider(thickness: 0.2, indent: 100, color: context.colors.iconColor, endIndent: 100),
              MovieListWidget(moviesList: movies),
              KeyedSubtree(key: seriesListKey, child: const SizedBox(height: 6)),
              Divider(thickness: 0.2, indent: 100, color: context.colors.iconColor, endIndent: 100),
              SerieListWidget(seriesList: series),
              const SizedBox(height: 6),
            ],
          )))),
    );
  }
}
