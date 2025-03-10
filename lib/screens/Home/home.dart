// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:home_finder_new/constants/routes.dart';
// import 'package:home_finder_new/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
// import 'package:home_finder_new/models/category_model/category_model.dart';
// import 'package:home_finder_new/models/product_model/product_model.dart';
// import 'package:home_finder_new/provider/app_provider.dart';
// import 'package:home_finder_new/screens/NavDrawer/navdrawer.dart';
// import 'package:home_finder_new/screens/category_view/category_view.dart';
// import 'package:home_finder_new/screens/product_details/product_details.dart';
// import 'package:provider/provider.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<CategoryModel> categoryList = [];
//   List<ProductModel> productModelList = [];

//   bool isLoading = false;
//   @override
//   void initState() {
//     AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
//     appProvider.getUserInfoFirebase();
//     getCategoryList();
//     super.initState();
//   }

//   void getCategoryList() async {
//     setState(() {
//       isLoading = true;
//     });
//     categoryList = await FirebaseFirestoreHelper.instance.getCategories();
//     productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();
//     categoryList.shuffle();
//     productModelList.shuffle();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   TextEditingController search = TextEditingController();
//   List<ProductModel> searchList = [];
//   void searchProducts(String value) {
//     searchList = productModelList
//         .where((element) =>
//             element.name.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),

//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               getCategoryList();
//             },
//           )
//         ],
//         // leading: Icon(Icons.list),
//         backgroundColor: Colors.red,
//         title: Text(
//           "Home Finder",
//           style: TextStyle(color: Colors.white),
//         ),
//         /*  actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuthHelper.instance.signOut();
//               Navigator.of(context).pop();
//               Routes.instance.push(widget: Welcome(), context: context);
//             },
//           ),
//         ], */
//       ),
//       body: isLoading
//           ? Center(
//               child: Container(
//                 height: 100,
//                 width: 100,
//                 alignment: Alignment.center,
//                 child: CircularProgressIndicator(),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: search,
//                       onChanged: (value) {
//                         searchProducts(value);
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.search),
//                           hintText: "Search..."),
//                     ),
//                     Text(
//                       "Categories",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       physics: AlwaysScrollableScrollPhysics(),
//                       child: Row(
//                         children: categoryList
//                             .map(
//                               (e) => CupertinoButton(
//                                 padding: EdgeInsets.all(0),
//                                 onPressed: () {
//                                   Routes.instance.push(
//                                       widget: CategoryView(categoryModel: e),
//                                       context: context);
//                                 },
//                                 child: Card(
//                                   elevation: 6.1,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15)),
//                                   color: Colors.red.withOpacity(.25),
//                                   child: Container(
//                                     height: 120,
//                                     width: 100,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Container(
//                                           height: 85,
//                                           width: 85,
//                                           child: Image.network(e.image),
//                                           // Image(
//                                           //     image: NetworkImage(e
//                                           //         .image)) // Image.network(e.image),
//                                           // child: Image.network(e["Source"]),
//                                         ),
//                                         Text(
//                                           e.name,
//                                           style: TextStyle(
//                                             fontSize: 10.0,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                             .toList(),
//                       ),
//                     )
//                     /* SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: categories
//                     .map((e) => Card(
//                           elevation: 7.0,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           color: Colors.white.withOpacity(0.3),
//                           child: Container(
//                             height: 120,
//                             width: 100,
//                             child: Column(
//                               children: [
//                                 Container(
//                                     height: 100,
//                                     width: 100,
//                                     child: Image.asset(e)),
//                                 Text("Bungalow")
//                               ],
//                             ),
//                           ),
//                         ))
//                     .toList(),
//               ),
//                       ) */
//                     ,
//                     Padding(
//                       padding: EdgeInsets.only(top: 10, bottom: 10),
//                       child: Text(
//                         "Top Visited Homes",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     search.text.isNotEmpty && categoryList.isEmpty
//                         ? Center(
//                             child: Text("No Match Home Found"),
//                           )
//                         : categoryList.isEmpty
//                             ? Center(
//                                 child: Text("Top Visited Homes Is Empty"),
//                               )
//                             : GridView.builder(
//                                 shrinkWrap: true,
//                                 primary: false,
//                                 gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 2,
//                                         mainAxisSpacing: 12.0,
//                                         childAspectRatio: .6,
//                                         crossAxisSpacing: 12.0),
//                                 itemBuilder: (context, index) {
//                                   ProductModel singleHome =
//                                       productModelList[index];
//                                   return Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.red.withOpacity(.3),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Image.network(
//                                             // Image.asset(
//                                             singleHome.image,
//                                             height: 100,
//                                             width: 100,
//                                           ),
//                                           Text("Name : ${singleHome.name}"),
//                                           // Text("Location : ${singleHome.location}"),
//                                           Text("Location :"),
//                                           Text(singleHome.location),
//                                           Text("Price: ${singleHome.price}"),
//                                           Container(
//                                             width: 120,
//                                             child: OutlinedButton(
//                                               onPressed: () {
//                                                 Routes.instance.push(
//                                                     widget: ProductDetails(
//                                                         singleProduct:
//                                                             singleHome),
//                                                     context: context);
//                                               },
//                                               child: Text(
//                                                 "Buy",
//                                                 style: TextStyle(
//                                                   color: Colors.red,
//                                                 ),
//                                               ),
//                                               style: OutlinedButton.styleFrom(
//                                                 disabledForegroundColor: Colors
//                                                     .red
//                                                     .withOpacity(0.38),
//                                                 shadowColor: Colors.red,
//                                                 foregroundColor: Colors.red,
//                                                 side: BorderSide(
//                                                     color: Colors.red,
//                                                     width: 1.6),
//                                               ),
//                                             ),
//                                           )
//                                         ]),
//                                   );
//                                 },
//                                 itemCount: productModelList.length,
//                               ),

//                     SizedBox(
//                       height: 50,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }

// //Extra code

// //     ListView.builder(
// //       itemBuilder: (context, index) {
// //         return Card(
// //           child: Container(
// //             width: 100,
// //             height: 100,
// //             color: Colors.red.withOpacity(0.4),
// //           ),
// //         );
// //       },
// //       itemCount: 5,
// //       physics: AlwaysScrollableScrollPhysics(),
// //     )
// //   ],
// // ));
// /*   body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                 Container(
//                   width: 300,
//                   child: Text("Home Finding", style: TextStyle(fontSize: 22)),
//                   alignment: Alignment.center,
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.logout),
//                   onPressed: () {
//                     FirebaseAuthHelper.instance.signOut();
//                     Navigator.of(context).pop();
//                     Routes.instance.push(widget: Welcome(), context: context);
//                   },
//                 ),
//               ]),
//               Container(
//                 child: GridView.builder(
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 100,
//                       width: 100,
//                       color: Colors.red.withOpacity(0.4),
//                     );
//                   },
//                   itemCount: 10,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ); */

// // "D:/Flutter Project/Home_Finder_Assets/Categories/Apartment.png"
// List<ProductModel> bestHome = [
//   ProductModel(
//       // image:
//       // "https://raw.githubusercontent.com/Aryankumar011/Home_Finder_Assets/main/Images/img_1.jpeg",
//       image: "assets/images/img_1.jpeg",
//       id: "1",
//       name: "Home1",
//       location: "Karjan,Vadodara",
//       price: "₹ 5L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_2.jpeg",
//       id: "2",
//       name: "Home2",
//       location: "Makarpura,Vadodara",
//       price: "₹ 4L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_3.jpeg",
//       id: "3",
//       name: "Home3",
//       location: "Chhani,Vadodara",
//       price: "₹ 15L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_4.jpeg",
//       id: "4",
//       name: "Home4",
//       location: "Dabhoi,Vadodara",
//       price: "₹ 20L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_5.jpeg",
//       id: "5",
//       name: "Home5",
//       location: "Maneja,Vadodara",
//       price: "₹ 15L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_6.jpeg",
//       id: "6",
//       name: "Home6",
//       location: "Akota,Vadodara",
//       price: "₹ 20L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       // image:
//       // "https://raw.githubusercontent.com/Aryankumar011/Home_Finder_Assets/main/Images/img_1.jpeg",
//       image: "assets/images/img_1.jpeg",
//       id: "1",
//       name: "Home1",
//       location: "Karjan,Vadodara",
//       price: "₹ 5L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_2.jpeg",
//       id: "2",
//       name: "Home2",
//       location: "Makarpura,Vadodara",
//       price: "₹ 4L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_3.jpeg",
//       id: "3",
//       name: "Home3",
//       location: "Chhani,Vadodara",
//       price: "₹ 15L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_4.jpeg",
//       id: "4",
//       name: "Home4",
//       location: "Dabhoi,Vadodara",
//       price: "₹ 20L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_5.jpeg",
//       id: "5",
//       name: "Home5",
//       location: "Maneja,Vadodara",
//       price: "₹ 15L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_6.jpeg",
//       id: "6",
//       name: "Home6",
//       location: "Akota,Vadodara",
//       price: "₹ 20L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       // image:
//       // "https://raw.githubusercontent.com/Aryankumar011/Home_Finder_Assets/main/Images/img_1.jpeg",
//       image: "assets/images/img_1.jpeg",
//       id: "1",
//       name: "Home1",
//       location: "Karjan,Vadodara",
//       price: "₹ 5L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_2.jpeg",
//       id: "2",
//       name: "Home2",
//       location: "Makarpura,Vadodara",
//       price: "₹ 4L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_3.jpeg",
//       id: "3",
//       name: "Home3",
//       location: "Chhani,Vadodara",
//       price: "₹ 15L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_4.jpeg",
//       id: "4",
//       name: "Home4",
//       location: "Dabhoi,Vadodara",
//       price: "₹ 20L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_5.jpeg",
//       id: "5",
//       name: "Home5",
//       location: "Maneja,Vadodara",
//       price: "₹ 15L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
//   ProductModel(
//       image: "assets/images/img_6.jpeg",
//       id: "6",
//       name: "Home6",
//       location: "Akota,Vadodara",
//       price: "₹ 20L",
//       description:
//           "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
//       isFavourite: false),
// ];

// List<Map<String, dynamic>> categoriesList = [
//   {
//     "Name": "Apartment",
//     "Source":
//         "https://homezonline.in/wp-content/uploads/2022/07/Small-home-design-with-pretty-exterior.jpg"
//   },
//   {
//     "Name": "Bungalow",
//     "Source":
//         "https://homezonline.in/wp-content/uploads/2022/07/Small-home-design-with-pretty-exterior.jpg"
//   },
//   {
//     "Name": "Farmhouse",
//     "Source":
//         "https://homezonline.in/wp-content/uploads/2022/07/Small-home-design-with-pretty-exterior.jpg"
//   },
// //   {"Name": "Single", "Source": "assets/Categories/Single.png"},
// //   {"Name": "Townhouse", "Source": "assets/Categories/Townhouse.png"},
// //   {"Name": "Villa", "Source": "assets/Categories/Villa.png"},
// ];

// var ArrData = [
//   {"Name": "Apartment", "Source": "assets/Categories/Apartment.png"},
//   {"Name": "Bungalow", "Source": "assets/Categories/Bungalow.png"},
//   {"Name": "Farmhouse", "Source": "assets/Categories/Farmhouse.png"},
//   {"Name": "Single", "Source": "assets/Categories/Single.png"},
//   {"Name": "Townhouse", "Source": "assets/Categories/Townhouse.png"},
//   {"Name": "Villa", "Source": "assets/Categories/Villa.png"},
// ];

// List<String> categories = [
//   // "D:/Flutter Project/Home_Finder_Assets/Categories/Apartment.png",
//   // "assets/Categories/Apartment.png",
//   "assets/Categories/Apartment.png",
//   "assets/Categories/Bungalow.png",
//   "assets/Categories/Farmhouse.png",
//   "assets/Categories/Single.png",
//   "assets/Categories/Townhouse.png",
//   "assets/Categories/Villa.png",
// ];

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:home_finder_new/models/category_model/category_model.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';
import 'package:home_finder_new/provider/app_provider.dart';
import 'package:home_finder_new/screens/NavDrawer/navdrawer.dart';
import 'package:home_finder_new/screens/category_view/category_view.dart';
import 'package:home_finder_new/screens/product_details/product_details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productModelList = [];

  bool isLoading = false;
  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoryList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();
    categoryList.shuffle();
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController search = TextEditingController();
  List<ProductModel> searchList = [];
  void searchProducts(String value) {
    searchList = productModelList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()) ||
            element.location.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              getCategoryList();
            },
          )
        ],
        backgroundColor: Colors.red,
        title: Text(
          "Home Finder",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: search,
                      onChanged: (value) {
                        searchProducts(value);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search by name or location..."),
                    ),
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Row(
                        children: categoryList
                            .map(
                              (e) => CupertinoButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Routes.instance.push(
                                      widget: CategoryView(categoryModel: e),
                                      context: context);
                                },
                                child: Card(
                                  elevation: 6.1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Colors.red.withOpacity(.25),
                                  child: Container(
                                    height: 120,
                                    width: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 85,
                                          width: 85,
                                          child: Image.network(e.image),
                                        ),
                                        Text(
                                          e.name,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Top Visited Homes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    search.text.isNotEmpty && searchList.isEmpty
                        ? Center(
                            child: Text("No Match Home Found"),
                          )
                        : searchList.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 12.0,
                                        childAspectRatio: .6,
                                        crossAxisSpacing: 12.0),
                                itemBuilder: (context, index) {
                                  ProductModel singleHome = searchList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            singleHome.image,
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text("Name : ${singleHome.name}"),
                                          Text("Location :"),
                                          Text(singleHome.location),
                                          Text("Price: ${singleHome.price}"),
                                          Container(
                                            width: 120,
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Routes.instance.push(
                                                    widget: ProductDetails(
                                                        singleProduct:
                                                            singleHome),
                                                    context: context);
                                              },
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                disabledForegroundColor: Colors
                                                    .red
                                                    .withOpacity(0.38),
                                                shadowColor: Colors.red,
                                                foregroundColor: Colors.red,
                                                side: BorderSide(
                                                    color: Colors.red,
                                                    width: 1.6),
                                              ),
                                            ),
                                          )
                                        ]),
                                  );
                                },
                                itemCount: searchList.length,
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 12.0,
                                        childAspectRatio: .6,
                                        crossAxisSpacing: 12.0),
                                itemBuilder: (context, index) {
                                  ProductModel singleHome =
                                      productModelList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            singleHome.image,
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text("Name : ${singleHome.name}"),
                                          Text("Location :"),
                                          Text(singleHome.location),
                                          Text("Price: ${singleHome.price}"),
                                          Container(
                                            width: 120,
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Routes.instance.push(
                                                    widget: ProductDetails(
                                                        singleProduct:
                                                            singleHome),
                                                    context: context);
                                              },
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                disabledForegroundColor: Colors
                                                    .red
                                                    .withOpacity(0.38),
                                                shadowColor: Colors.red,
                                                foregroundColor: Colors.red,
                                                side: BorderSide(
                                                    color: Colors.red,
                                                    width: 1.6),
                                              ),
                                            ),
                                          )
                                        ]),
                                  );
                                },
                                itemCount: productModelList.length,
                              ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
