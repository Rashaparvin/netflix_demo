import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../../core/constants.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 2,
                  ),
                );
              } else if (state.isError) {
                return const Center(child: Text('Error while getting data'));
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text('List is empty'));
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        title: movie.title ?? 'No title provided',
                        imageUrl: '$imageAppendUrl${movie.posterPath}');
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final imgSize = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: imgSize * 0.35,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kWidth,
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )),
        const Icon(
          Icons.play_circle_outline_rounded,
          color: kWhiteColor,
          size: 40,
        )
      ],
    );
  }
}
