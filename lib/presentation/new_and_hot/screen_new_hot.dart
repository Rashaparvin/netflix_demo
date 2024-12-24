import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/every_watching_widget.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

import '../../core/colors/colors.dart';

class ScreenNewHot extends StatelessWidget {
  const ScreenNewHot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: AppBar(
                title: const Text(
                  "New & Hot",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                actions: [
                  const Icon(Icons.cast, color: Colors.white),
                  kWidth,
                  Container(
                    width: 30,
                    height: 20,
                    color: Colors.blue,
                  ),
                  kWidth,
                ],
                bottom: TabBar(
                    padding: const EdgeInsets.all(8),
                    labelColor: kBlackColor,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    unselectedLabelColor: kWhiteColor,
                    isScrollable: true,
                    indicator: BoxDecoration(
                        color: kWhiteColor, borderRadius: kRadius30),
                    tabs: const [
                      Tab(
                        text: "🍿 Coming Soon",
                      ),
                      Tab(
                        text: "👀 Everyone's watching",
                      ),
                    ]),
              )),
          body: TabBarView(children: [
            const ComingSoonList(
              key: Key('coming_soon'),
            ),
            const EveryonesWatchingList(
              key: Key('everyone_is_watching'),
            ),
          ]),
        ),
      ),
    );
  }

  // Widget _buildTabBarView1() {
  //   return ListView.builder(
  //     itemBuilder: ((context, index) => const ComingSoonWidget()),
  //     itemCount: 10,
  //   );
  // }

  // Widget _buildTabBarView2() {
  //   return ListView.builder(
  //     itemBuilder: ((context, index) => const EveryonesWatchingWidget()),
  //     itemCount: 10,
  //   );
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
                child: Text('Error while loading coming soon list'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('Coming soon list is empty'));
          } else {
            return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: ((context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[2];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    description: movie.overview ?? 'No Description');
              }),
            );
          }
        },
      ),
    );
  }
}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
                child: Text('Error while loading everyone is watching list'));
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
                child: Text('Everyone is watching list is empty'));
          } else {
            return ListView.builder(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: ((context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                return EveryonesWatchingWidget(
                    id: movie.id.toString(),
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalName ?? 'No Title',
                    description: movie.overview ?? 'No Description');
              }),
            );
          }
        },
      ),
    );
  }
}
