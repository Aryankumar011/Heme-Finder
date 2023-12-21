import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/conststants.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/screens/Home/home.dart';
import 'package:home_finder_new/screens/auth_ui/sign_up/sign_up.dart';
import 'package:home_finder_new/widgets/primarybutton/primary_button.dart';
import 'package:home_finder_new/widgets/top_titles/top_titleles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                title: "Login",
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                        bool isVaildated =
                            loginVaildation(email.text, password.text);
                        if (isVaildated) {
                          bool isLogined = await FirebaseAuthHelper.instance
                              .login(email.text, password.text, context);
                          if (isLogined) {
                            Routes.instance.pushAndRemoveUntil(
                                widget: const Home(), context: context);
                          }
                        }
                      },
                      title: "Login"),
                ]),
              ),
              const Center(child: Text("Don't have an Account ?")),
              const SizedBox(
                height: 12,
              ),

              Center(
                child: CupertinoButton(
                  child: const Text('Create an Account'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Routes.instance.push(widget: SignUp(), context: context);
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
