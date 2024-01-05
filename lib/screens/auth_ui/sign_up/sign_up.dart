import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/conststants.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/screens/Home/home.dart';
import 'package:home_finder_new/screens/auth_ui/login/login.dart';
import 'package:home_finder_new/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';
import 'package:home_finder_new/widgets/top_titles/top_titleles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                    controller: name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person), hintText: "Name"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail), hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone), hintText: "Phone"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: CupertinoButton(
                            // child: const Icon(
                            //   Icons.visibility,
                            //   color: Colors.grey,
                            // ),
                            onPressed: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                            child: Icon(
                              isShowPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            )),
                        hintText: "Password"),
                    obscureText: isShowPassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                      onPressed: () async {
                        bool isVaildated = signUpVaildation(
                            email.text, password.text, name.text, phone.text);
                        if (isVaildated) {
                          bool isLogined = await FirebaseAuthHelper.instance
                              .signUp(name.text, email.text, password.text,
                                  context);
                          if (isLogined) {
                            Routes.instance.pushAndRemoveUntil(
                                widget: CustomBottomBar() /* Home() */,
                                context: context);
                          }
                        }
                      },
                      title: "Sign Up"),
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
                    Navigator.of(context).pop();
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
