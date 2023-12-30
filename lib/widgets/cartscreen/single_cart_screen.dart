import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCarttItem extends StatefulWidget {
  const SingleCarttItem({super.key});

  @override
  State<SingleCarttItem> createState() => _SingleCarttItemState();
}

class _SingleCarttItemState extends State<SingleCarttItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
              // flex: 1,
              child: Container(
            child: Image.network("https://picsum.photos/99/101.jpg"),
            height: 110,
            color: Colors.red.withOpacity(.3),
          )), // Image.network("https://picsum.photos/99/101.jpg")),
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name :Aryan Panchal",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        // Text("Location : ${singleHome.location}"),
                        Text("Location : Vadodara ",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        // Text(""),
                        Text(
                          "Price: 100L",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        CupertinoButton(
                            padding: EdgeInsets.all(0),
                            child: Text("Add To Wishlist",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red)),
                            onPressed: () {})
                      ],
                    )
                  ],
                ),
                // color: Colors.black.withOpacity(.5),
              ))
        ],
      ),
      decoration: BoxDecoration(
          //color: Colors.red.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.red,
            width: 2,
          )),
    );
  }
}
