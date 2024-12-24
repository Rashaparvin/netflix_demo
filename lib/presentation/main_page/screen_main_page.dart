import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

import '../../core/colors/colors.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
              valueListenable: indexChanged,
              builder: (context, int value, _) {
                return _pages[value];
              }),
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
