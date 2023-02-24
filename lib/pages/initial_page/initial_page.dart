import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar()),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
                  child: Column(
        children: [
          const BannerHighlightFront(),
          const SizedBox(height: 6),
          RecentsListWidget(recentList: recentList),
          const SizedBox(height: 6),
          Divider(thickness: 0.2, indent: 100, color: context.colors.iconColor, endIndent: 100),
          MyListWidget(myList: myList),
          const SizedBox(height: 6),
          const MovieBanner(),
          const SizedBox(height: 6),
          ReleaseListWidget(list: movies.reversed),
          const SizedBox(height: 6),
          Divider(thickness: 0.2, indent: 100, color: context.colors.iconColor, endIndent: 100),
          MovieListWidget(moviesList: movies),
          const SizedBox(height: 6),
          Divider(thickness: 0.2, indent: 100, color: context.colors.iconColor, endIndent: 100),
          SerieListWidget(seriesList: series),
          const SizedBox(height: 6),
        ],
      )))),
    );
  }
}
