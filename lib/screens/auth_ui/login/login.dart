import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/screens/auth_ui/Home/home.dart';
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
                  PrimaryButton(onPressed: () {}, title: "Login"),
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
                    Routes.instance.pushAndRemoveUntill(
                        widget: const Home(), context: context);
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
