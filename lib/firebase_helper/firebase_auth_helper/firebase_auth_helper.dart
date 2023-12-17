import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/screens/auth_ui/Home/home.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();
  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      // _auth.signInWithEmailAndPassword(email: email, password: password);
      await Routes.instance
          .pushAndRemoveUntill(widget: Home(), context: context);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
