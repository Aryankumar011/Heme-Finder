import 'package:flutter/material.dart';
import 'package:home_finder_new/widgets/top_titles/top_titleles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          // Icon(Icons.arrow_back),
          TopTitles(
            subTitle: "Wellcome Back To Home Finder App",
            title: "Login",
          ),
        ],
      ),
    );
  }
}
