import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:home_finder_new/models/category_model/category_model.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';
import 'package:home_finder_new/screens/product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];

  bool isLoading = false;
  @override
  void initState() {
    // AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    // appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryModel.name),
        ),
        body: isLoading
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              )
            : productModelList.isEmpty
                ? Center(
                    child: Text("Homes Not Found.."),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: .6,
                          crossAxisSpacing: 12.0),
                      itemBuilder: (context, index) {
                        ProductModel singleHome = productModelList[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  // Image.asset(
                                  singleHome.image,
                                  height: 100,
                                  width: 100,
                                ),
                                Text("Name : ${singleHome.name}"),
                                // Text("Location : ${singleHome.location}"),
                                Text("Location :"),
                                Text(singleHome.location),
                                Text("Price: ${singleHome.price}"),
                                Container(
                                  width: 120,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Routes.instance.push(
                                          widget: ProductDetails(
                                              singleProduct: singleHome),
                                          context: context);
                                    },
                                    child: Text(
                                      "Buy",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      disabledForegroundColor:
                                          Colors.red.withOpacity(0.38),
                                      shadowColor: Colors.red,
                                      foregroundColor: Colors.red,
                                      side: BorderSide(
                                          color: Colors.red, width: 1.6),
                                    ),
                                  ),
                                )
                              ]),
                        );
                      },
                      itemCount: productModelList.length,
                    ),
                  ));
  }
}
