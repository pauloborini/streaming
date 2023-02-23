import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/banner_highlight.dart';
import '../../core/widgets/base_appbar.dart';
import '../../core/widgets/my_list.dart';
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
  late List<VideoModel> recents;
  late List<VideoModel> series;
  late List<VideoModel> movies;

  readData() async {
    loaded.value = false;
    myList = Provider.of<VideoRepository>(context).findAllVideos();
    recents = [...myList.reversed];
    series = [...myList.sublist(0, 9)];
    movies = [...myList.sublist(10, 15)];
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
          MyListWidget(myList: myList)
        ],
      )))),
    );
  }
}
