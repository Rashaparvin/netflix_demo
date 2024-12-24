import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 10, top: 10),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
