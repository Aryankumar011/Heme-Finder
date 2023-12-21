import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopTitles({super.key, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 12,
          // ),
          if (title == "Login" || title == "Create Account")
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          SizedBox(
            height: 10,
          ),
          // BackButton(),
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
      ),
    );
  }
}
