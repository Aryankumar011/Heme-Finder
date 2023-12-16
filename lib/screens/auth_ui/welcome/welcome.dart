import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/assets_images.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
          ],
        ),
      ),
    );
  }
}
