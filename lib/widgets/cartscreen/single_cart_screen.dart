import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/conststants.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';
import 'package:home_finder_new/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SingleCarttItem extends StatefulWidget {
  final ProductModel singleProduct;

  const SingleCarttItem({super.key, required this.singleProduct});

  @override
  State<SingleCarttItem> createState() => _SingleCarttItemState();
}

class _SingleCarttItemState extends State<SingleCarttItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
              // flex: 1,
              child: Container(
            child: Image.network(widget.singleProduct.image),
            height: 100,
            color: Colors.red.withOpacity(.3),
          )), // Image.network("https://picsum.photos/99/101.jpg")),
          Expanded(
              flex: 2,
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Name : ${widget.singleProduct.name}",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            // Text("Location : ${singleHome.location}"),
                            Text("Location : ${widget.singleProduct.location}",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            // Text(""),
                            Text(
                              "Price: ${widget.singleProduct.price}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            CupertinoButton(
                                padding: EdgeInsets.all(0),
                                minSize: 0,
                                child: Text("Add To Wishlist",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red)),
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                    CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        // child: Text("Remove From Cart",
                        //     style:
                        //         TextStyle(fontSize: 12, color: Colors.red)),
                        onPressed: () {
                          AppProvider appProvider =
                              Provider.of<AppProvider>(context, listen: false);
                          appProvider.removeCartProduct(widget.singleProduct);
                          showMessage("Removed From To Cart");
                        })
                  ],
                ),

                // color: Colors.black.withOpacity(.5),
              ))
        ],
      ),
      decoration: BoxDecoration(
          //color: Colors.red.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.red,
            width: 2,
          )),
    );
  }
}
