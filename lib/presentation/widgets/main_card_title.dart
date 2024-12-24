import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainCardTitle extends StatelessWidget {
  final String title1;
  final List movie;

  const MainCardTitle({
    super.key,
    required this.title1,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title1),
          kHeight,
          LimitedBox(
            maxHeight: 180,
            child: ListView( 
                scrollDirection: Axis.horizontal,
                children: List.generate(movie.length, (index) {
                  final imgUrl = '$imageAppendUrl${movie[index].posterPath}';
                  return MainCard(imgUrlNew: imgUrl);
                })),
          ),
          kHeight2
        ],
      ),
    );
  }
}
