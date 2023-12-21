import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/screens/auth_ui/welcome/welcome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(children: [
            Text('Good'),
            IconButton(
              alignment: Alignment.topRight,
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuthHelper.instance.signOut();
                Navigator.of(context).pop();
                Routes.instance.push(widget: Welcome(), context: context);
              },
            ),
          ]),
          Text('Hello')
        ]),
      ),
    );
  }
}
