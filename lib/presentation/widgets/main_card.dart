import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String imgUrlNew;
  const MainCard({
    super.key,
    required this.imgUrlNew,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 120,
        //  height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imgUrlNew))),
      ),
    );
  }
}
