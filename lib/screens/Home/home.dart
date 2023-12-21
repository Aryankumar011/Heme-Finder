import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buy Any Home"),
        ),
        body: Row(
          children: [
            TextFormField(),
            Card(
              child: Container(
                height: 100,
                width: 100,
              ),
            )
          ],
        ));
  }
}
