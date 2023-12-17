import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/screens/auth_ui/login/login.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';
import 'package:home_finder_new/widgets/top_titles/top_titleles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon(Icons.arrow_back),
              const TopTitles(
                subTitle: "Welcome Back To Home Finder App",
                title: "Create Account",
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person), hintText: "Name"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail), hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone), hintText: "Phone"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: CupertinoButton(
                            child: const Icon(
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
              const Center(child: Text("I have already an Account")),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: CupertinoButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Routes.instance.push(widget: Login(), context: context);
                  },
                ),
              ),

              // TextButton(onPressed: () {}, child: Text('Create an Account')),
            ],
          ),
        ),
      ),
    );
  }
}
