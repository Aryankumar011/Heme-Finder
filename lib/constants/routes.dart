import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();

  // ignore: non_constant_identifier_names
  Future<dynamic> pushAndRemoveUntil({required widget, required context}) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (route) => false);
  }

  Future<dynamic> push({required Widget widget, required context}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }
}
