import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_finder_new/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    /* return Scaffold( 
      body: Stack(
        children: <Widget>[
          Container(color: Theme.of(context).colorScheme.secondary),
          Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 48.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const CircularProgressIndicator(),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                    'This is sample 1 Splash screen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    */
    return Scaffold(
      body: Text("Hello"),
    );
  }
}
