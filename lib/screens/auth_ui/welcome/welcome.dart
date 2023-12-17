import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/assets_images.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/screens/auth_ui/login/login.dart';
import 'package:home_finder_new/screens/auth_ui/sign_up/sign_up.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';
import 'package:home_finder_new/widgets/top_titles/top_titleles.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(
              title: 'Welcome',
              subTitle: 'Buy Any Home Using This App',
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                AssetsImages.welcomeImage,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(widget: Login(), context: context);
                },
                title: 'Login'),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
                onPressed: () {
                  Routes.instance.push(widget: SignUp(), context: context);
                },
                title: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
