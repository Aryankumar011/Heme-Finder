import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text("Account")),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.person_outline_outlined,
                      size: 100,
                    ),
                    Text(
                      "Aryan Panchal",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("aryanpanchal1110@gmail.com"),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text("Your Purchage Homes"),
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite_outline),
                      title: Text("Favourite Homes"),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("About As"),
                    ),
                    Text("Version 1.0.0")
                  ],
                ),
              ),
              flex: 2,
            )
          ],
        ));
  }
}
