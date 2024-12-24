import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/search/widgets/search_result_detail.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import '../../../application/search/search_bloc.dart';
import '../../../core/constants.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 3,
                children: List.generate(state.searchResultList.length, (index) {
                  final movie = state.searchResultList[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => MovieDetails(
                                      id: movie.id!,
                                    )));
                      },
                      child: Card(
                        imageUrl: movie.posterImageUrl,
                      ));
                }));
          },
        ))
      ],
    );
  }
}

class Card extends StatelessWidget {
  final String imageUrl;
  const Card({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }
}
