import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imurl});

  final int index;
  final String imurl;
        

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 120,
              //  height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          imurl))),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: -30,
          child: StrokeText(
            text: "${index + 1}",
            textStyle: TextStyle(
                fontSize: 120, color: kBlackColor, fontWeight: FontWeight.bold),
            strokeColor: kWhiteColor.withOpacity(0.7),
            strokeWidth: 4,
          ),
        )
      ],
    );
  }
}
