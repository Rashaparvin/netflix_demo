import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../application/home_page/home_bloc.dart';
import '../../core/colors/colors.dart';
import '../widgets/main_card_title.dart';

ValueNotifier<bool> scrollNotify = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

    return Scaffold(
        backgroundColor: bgColor1,
        body: ValueListenableBuilder(
            valueListenable: scrollNotify,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotify.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotify.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.isError) {
                          return const Center(
                            child: Text('Error while getting data'),
                          );
                        } else if (state.trendingList.isEmpty) {
                          return const Center(child: Text('list is empty'));
                        }
                        final trendingmovie = state.trendingList;
                        final dramaList = state.tenseDramaList;
                        final top10 = state.top10;
                        final releasedLastYearMovies = state.releasedPastYear;
                        final trendingMost = state.trendingList[0];
                        final southIndian = state.southIndian;
                        return ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 600,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              '$imageAppendUrl${trendingMost.posterPath}',
                                            ))),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: kWhiteColor,
                                              size: 25,
                                            ),
                                            Text(
                                              'My List',
                                            )
                                          ],
                                        ),
                                        _PlayButton(),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.info_outline,
                                              color: kWhiteColor,
                                              size: 25,
                                            ),
                                            Text(
                                              'Info',
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            kHeight,
                            MainCardTitle(
                                movie: releasedLastYearMovies, title1: 'Released in the Past Year'),
                            MainCardTitle(
                                movie: trendingmovie, title1: 'Trending Now'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MainTitle(
                                    title: 'Top 10 TV Shows in India Today'),
                                kHeight,
                                LimitedBox(
                                  maxHeight: 180,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(10, (index) {
                                        final imgUrl = '$imageAppendUrl${top10[index].posterPath}';
                                        return NumberCard(
                                          imurl: imgUrl,
                                          index: index,
                                        );
                                      })),
                                ),
                                kHeight2
                              ],
                            ),
                            // MainCardTitle(
                            //   title1: 'Tense Dramas',
                            //   movie: [],
                            // ),
                            MainCardTitle(
                                movie: dramaList, title1: 'Tense Dramas'),
                            MainCardTitle(
                              title1: 'South Indian Cinema',
                              movie: southIndian,
                            ),
                          ],
                        );
                      },
                    ),
                    scrollNotify.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 100,
                            color: Colors.transparent.withOpacity(0.3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                      height: 70,
                                      width: 70,
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.cast, color: Colors.white),
                                    kWidth,
                                    Container(
                                      color: Colors.blue,
                                      width: 20,
                                      height: 20,
                                    ),
                                    kWidth,
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('TV Shows', style: kHomeTitleStyle),
                                    Text('Movies', style: kHomeTitleStyle),
                                    Text('Categories', style: kHomeTitleStyle)
                                  ],
                                )
                              ],
                            ),
                          )
                        : kHeight
                  ],
                ),
              );
            }));
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(color: kBlackColor, fontSize: 18),
          ),
        ));
  }
}
