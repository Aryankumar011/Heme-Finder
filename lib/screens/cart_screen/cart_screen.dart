import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/widgets/cartscreen/single_cart_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: Text("My Cart"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return SingleCarttItem();
          },
          itemCount: 4,
        ));
  }
}
