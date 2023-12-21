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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Text("Home Finder"),
            if (kIsWeb)
              SizedBox(
                width: double.minPositive,
              )
            else
              SizedBox(
                width: 195,
              ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuthHelper.instance.signOut();
                  Navigator.of(context).pop();
                  Routes.instance.push(widget: Welcome(), context: context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: "Search..."),
          ),
          Text(
            "Categories",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoriesList
                  .map((e) => Card(
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white,
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(e['Source']),
                              ),
                              Text(e["Name"])
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
          /* SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map((e) => Card(
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.white.withOpacity(0.3),
                        child: Container(
                          height: 120,
                          width: 100,
                          child: Column(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(e)),
                              Text("Bungalow")
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ) */
        ]),
      ),
    );
  }
}

//Extra code

//     ListView.builder(
//       itemBuilder: (context, index) {
//         return Card(
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.red.withOpacity(0.4),
//           ),
//         );
//       },
//       itemCount: 5,
//       physics: AlwaysScrollableScrollPhysics(),
//     )
//   ],
// ));
/*   body: SafeArea(
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
              Container(
                child: GridView.builder(
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
                ),
              )
            ],
          ),
        ),
      ),
    ); */

// "D:/Flutter Project/Home_Finder_Assets/Categories/Apartment.png"

List<Map<String, dynamic>> categoriesList = [
  {"Name": "Apartment", "Source": "assets/Categories/Apartment.png"},
  {"Name": "Bungalow", "Source": "assets/Categories/Bungalow.png"},
  {"Name": "Farmhouse", "Source": "assets/Categories/Farmhouse.png"},
  {"Name": "Single", "Source": "assets/Categories/Single.png"},
  {"Name": "Townhouse", "Source": "assets/Categories/Townhouse.png"},
  {"Name": "Villa", "Source": "assets/Categories/Villa.png"},
];

var ArrData = [
  {"Name": "Apartment", "Source": "assets/Categories/Apartment.png"},
  {"Name": "Bungalow", "Source": "assets/Categories/Bungalow.png"},
  {"Name": "Farmhouse", "Source": "assets/Categories/Farmhouse.png"},
  {"Name": "Single", "Source": "assets/Categories/Single.png"},
  {"Name": "Townhouse", "Source": "assets/Categories/Townhouse.png"},
  {"Name": "Villa", "Source": "assets/Categories/Villa.png"},
];

List<String> categories = [
  // "D:/Flutter Project/Home_Finder_Assets/Categories/Apartment.png",
  // "assets/Categories/Apartment.png",
  "assets/Categories/Apartment.png",
  "assets/Categories/Bungalow.png",
  "assets/Categories/Farmhouse.png",
  "assets/Categories/Single.png",
  "assets/Categories/Townhouse.png",
  "assets/Categories/Villa.png",
];
