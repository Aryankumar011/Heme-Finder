import 'package:flutter/material.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.singleProduct});
  final ProductModel singleProduct;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  widget.singleProduct.image,
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.singleProduct.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {
                        widget.singleProduct.isFavourite =
                            !widget.singleProduct.isFavourite;
                        setState(() {});
                      },
                      icon: Icon(
                        widget.singleProduct.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      )),
                ],
              ),
              Text("Price : ${widget.singleProduct.price}"),
              SizedBox(
                height: 20,
              ),
              Text("Location :${widget.singleProduct.location}"),
              SizedBox(
                height: 20,
              ),
              Text("Description :${widget.singleProduct.description}"),
              //  Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    child: OutlinedButton(
                      style: ButtonStyle(),
                      onPressed: () {},
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "BUY",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
