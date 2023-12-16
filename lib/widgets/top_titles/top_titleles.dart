import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitles({super.key, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kToolbarHeight - 10,
        ),
        Text(title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Text(subTitle,
            style: TextStyle(
              fontSize: 20,
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
