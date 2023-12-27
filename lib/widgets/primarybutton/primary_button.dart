import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
//  PrimaryButton({super.key});
  final void Function()? onPressed;
  final String title;
  const PrimaryButton(
      {super.key, required this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
