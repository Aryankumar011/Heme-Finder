import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/main.dart';
import 'package:home_finder_new/screens/auth_ui/welcome/welcome.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/img_5.jpeg'))),
              // image: NetworkImage(
              //   "https://drive.google.com/uc?export=view&id=1XE8JnGc056qDu985UZ54b9vH6cXDJMdL",
              // scale: 2.0))),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Welcome'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuthHelper.instance.signOut();
                // Navigator.of(context).pop();
                // Routes.instance.push(widget: Welcome(), context: context);
                setState(() {
                  Navigator.of(context).pop();
                  Routes.instance
                      .pushAndRemoveUntil(widget: InitHome(), context: context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
