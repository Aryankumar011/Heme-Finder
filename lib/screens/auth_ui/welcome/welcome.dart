import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/assets_images.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kToolbarHeight - 10,
            ),
            const Text('Welcome',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const Text('Buy Any Home Using This App',
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
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
            PrimaryButton(onPressed: () {}, title: 'Login'),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(onPressed: () {}, title: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
