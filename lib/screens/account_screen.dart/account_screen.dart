import 'package:flutter/material.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/provider/app_provider.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
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
                    appProvider.getUserInformation.image == null
                        ? const Icon(
                            Icons.person_outline,
                            size: 120,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                appProvider.getUserInformation.image!),
                            radius: 60,
                          ),
                    Text(
                      appProvider.getUserInformation.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      appProvider.getUserInformation.email,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 150,
                      child: PrimaryButton(
                        title: "Edit Profile",
                        onPressed: () {
                          /*  Routes.instance
                          .push(widget: const EditProfile(), context: context); */
                        },
                      ),
                    ),
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
                    ListTile(
                      leading: Icon(Icons.support),
                      title: Text("Support"),
                    ),
                    ListTile(
                      onTap: () {
                        FirebaseAuthHelper.instance.signOut();
                        setState(() {});
                      },
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Log Out"),
                    ),
                    Text("Version 1.0.0")
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ));
  }
}
