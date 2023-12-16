import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';
import 'package:home_finder_new/widgets/top_titles/top_titleles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(Icons.arrow_back),
          const TopTitles(
            subTitle: "Welcome Back To Home Finder App",
            title: "Login",
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail), hintText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: CupertinoButton(
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        }),
                    hintText: "Password"),
                obscureText: isShowPassword,
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(onPressed: () {}, title: "Login"),
            ]),
          ),
          const Center(child: Text("Don't have an Account ?")),
          SizedBox(
            height: 12,
          ),

          Center(
              child: CupertinoButton(
                  child: Text('Create an Account'), onPressed: () {})),

          // TextButton(onPressed: () {}, child: Text('Create an Account')),
        ],
      ),
    );
  }
}
