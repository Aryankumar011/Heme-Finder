import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/widgets/cartscreen/single_cart_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: Text("My Cart"),
        ),
        body: appProvider.getcartProductList.isEmpty
            ? Center(
                child: Text("Empty"),
              )
            : ListView.builder(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return SingleCarttItem(
                    singleProduct: appProvider.getcartProductList[index],
                  );
                },
                itemCount: appProvider.getcartProductList.length,
              ));
  }
}
