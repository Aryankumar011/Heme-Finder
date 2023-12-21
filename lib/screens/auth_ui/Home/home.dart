import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/screens/auth_ui/welcome/welcome.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Align(
      //     alignment: Alignment.topRight,
      //     child: IconButton(
      //       icon: Icon(Icons.logout),
      //       onPressed: () {
      //         FirebaseAuthHelper.instance.signOut();
      //         Navigator.of(context).pop();
      //         Routes.instance.push(widget: Welcome(), context: context);
      //       },
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  width: 300,
                  child: Text("Home Finding", style: TextStyle(fontSize: 22)),
                  alignment: Alignment.center,
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    FirebaseAuthHelper.instance.signOut();
                    Navigator.of(context).pop();
                    Routes.instance.push(widget: Welcome(), context: context);
                  },
                ),
              ]),
              GridView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.red.withOpacity(0.4),
                  );
                },
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
