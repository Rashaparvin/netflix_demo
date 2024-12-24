import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(
                    fontSize: 18, color: kWhiteColor.withOpacity(0.5)),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 490,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              kHeight2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -4),
                    ),
                  ),
                  CustomButtonWidget(
                    icon: Icons.notifications_none_outlined,
                    title: 'Remind Me',
                    iconSize: 25,
                    textSize: 13,
                  ),
                  kWidth,
                  CustomButtonWidget(
                    icon: Icons.info_outlined,
                    title: 'info',
                    iconSize: 25,
                    textSize: 13,
                  ),
                  kWidth
                ],
              ),
              kHeight,
              Text(
                "Coming on $day $month",
                style: const TextStyle(
                    fontSize: 18,
                    color: kGreyColor,
                    fontWeight: FontWeight.bold),
              ),
              kHeight,
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
              Text(movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              kHeight,
              Text(
                description,
                maxLines: 5,
                style: TextStyle(color: kGreyColor, fontSize: 15),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    super.key,
    required this.title,
    required this.textSize,
    required this.icon,
    required this.iconSize,
  });

  IconData icon;
  String title;
  double iconSize;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              icon,
              color: kWhiteColor,
              size: iconSize,
            ),
            Text(
              title,
              style: TextStyle(fontSize: textSize, color: kGreyColor),
            )
          ],
        )
      ],
    );
  }
}
