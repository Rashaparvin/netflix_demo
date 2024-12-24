import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constants.dart';

import '../../../application/search/search_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../domain/search/model/search_response/search_response.dart';

class MovieDetails extends StatelessWidget {
  final int id;
  const MovieDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            final movie = state.searchResultList.firstWhere(
              (element) => element.id == id,
              orElse: () => SearchResultData(
                  id: 0,
                  originalTitle: 'Not Found',
                  posterPath: null,
                  overView: 'Not Found'),
            );

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  kHeight,
                  Container(
                    height: 250,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            '$imageAppendUrl${movie.posterPath ?? ''}'),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.network(
                        "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                        height: 25,
                        width: 25,
                      ),
                      const Text(
                        "FILM",
                        style: TextStyle(
                            fontSize: 11, letterSpacing: 2, color: kGreyColor),
                      )
                    ],
                  ),
                  kHeight2,
                  Text(
                    movie.title ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  kHeight,
                  Text(
                    movie.overView ?? '',
                    style: const TextStyle(fontSize: 17, color: kGreyColor),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
