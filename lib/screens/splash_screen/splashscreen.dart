import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_finder_new/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InitHome(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Created By : Aryan Panchal",
              style: TextStyle(fontSize: 10.0),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "©aryanpanchal.me",
              style: TextStyle(fontSize: 10.0),
            ),
          ],
        ));
  }
}

















/* 
class SplashScreen extends StatefulWidget { 
  @override 
  _SplashScreenState createState() => _SplashScreenState(); 
} 
class _SplashScreenState extends State<SplashScreen> { 
  @override 
  void initState() { 
    super.initState(); 
    Timer(Duration(seconds: 3), 
          ()=>Navigator.pushReplacement(context, 
                                        MaterialPageRoute(builder: 
                                                          (context) =>  
                                                          SecondScreen() 
                                                         ) 
                                       ) 
         ); 
  } 
  @override 
  Widget build(BuildContext context) { 
    return Container( 
      color: Colors.white, 
      child:FlutterLogo(size:MediaQuery.of(context).size.height) 
    ); 
  } 
} */