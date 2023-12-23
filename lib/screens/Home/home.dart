import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_finder_new/constants/routes.dart';
import 'package:home_finder_new/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';
import 'package:home_finder_new/screens/NavDrawer/navdrawer.dart';
import 'package:home_finder_new/screens/auth_ui/welcome/welcome.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        // leading: Icon(Icons.list),
        backgroundColor: Colors.red,
        title: Text("Home Finder"),
        /*  actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuthHelper.instance.signOut();
              Navigator.of(context).pop();
              Routes.instance.push(widget: Welcome(), context: context);
            },
          ),
        ], */
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: "Search..."),
            ),
            Text(
              "Categories",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriesList
                    .map((e) => Card(
                          elevation: 7.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.white,
                          child: Container(
                            height: 120,
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(e['Source']),
                                ),
                                Text(e["Name"])
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
            /* SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map((e) => Card(
                          elevation: 7.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.white.withOpacity(0.3),
                          child: Container(
                            height: 120,
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(e)),
                                Text("Bungalow")
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
                      ) */
            ,
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Top Visited Homes",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: .75,
                  crossAxisSpacing: 12.0),
              itemBuilder: (context, index) {
                ProductModel singleHome = bestHome[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.network(
                        Image.asset(
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
                            onPressed: () {},
                            child: Text(
                              "Buy",
                              style: TextStyle(color: Colors.red),
                            ),
                            style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.red, width: 1.6)),
                          ),
                        )
                      ]),
                );
              },
              itemCount: bestHome.length,
            )
          ]),
        ),
      ),
    );
  }
}

//Extra code

//     ListView.builder(
//       itemBuilder: (context, index) {
//         return Card(
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.red.withOpacity(0.4),
//           ),
//         );
//       },
//       itemCount: 5,
//       physics: AlwaysScrollableScrollPhysics(),
//     )
//   ],
// ));
/*   body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  width: 300,
                  child: Text("Home Finding", style: TextStyle(fontSize: 22)),
                  alignment: Alignment.center,
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    FirebaseAuthHelper.instance.signOut();
                    Navigator.of(context).pop();
                    Routes.instance.push(widget: Welcome(), context: context);
                  },
                ),
              ]),
              Container(
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.red.withOpacity(0.4),
                    );
                  },
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ); */

// "D:/Flutter Project/Home_Finder_Assets/Categories/Apartment.png"
List<ProductModel> bestHome = [
  ProductModel(
      // image:
      // "https://raw.githubusercontent.com/Aryankumar011/Home_Finder_Assets/main/Images/img_1.jpeg",
      image: "assets/images/img_1.jpeg",
      id: "1",
      name: "Home1",
      location: "Karjan,Vadodara",
      price: "₹ 5L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_2.jpeg",
      id: "2",
      name: "Home2",
      location: "Makarpura,Vadodara",
      price: "₹ 4L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_3.jpeg",
      id: "3",
      name: "Home3",
      location: "Chhani,Vadodara",
      price: "₹ 15L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_4.jpeg",
      id: "4",
      name: "Home4",
      location: "Dabhoi,Vadodara",
      price: "₹ 20L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_5.jpeg",
      id: "5",
      name: "Home5",
      location: "Maneja,Vadodara",
      price: "₹ 15L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_6.jpeg",
      id: "6",
      name: "Home6",
      location: "Akota,Vadodara",
      price: "₹ 20L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      // image:
      // "https://raw.githubusercontent.com/Aryankumar011/Home_Finder_Assets/main/Images/img_1.jpeg",
      image: "assets/images/img_1.jpeg",
      id: "1",
      name: "Home1",
      location: "Karjan,Vadodara",
      price: "₹ 5L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_2.jpeg",
      id: "2",
      name: "Home2",
      location: "Makarpura,Vadodara",
      price: "₹ 4L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_3.jpeg",
      id: "3",
      name: "Home3",
      location: "Chhani,Vadodara",
      price: "₹ 15L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_4.jpeg",
      id: "4",
      name: "Home4",
      location: "Dabhoi,Vadodara",
      price: "₹ 20L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_5.jpeg",
      id: "5",
      name: "Home5",
      location: "Maneja,Vadodara",
      price: "₹ 15L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_6.jpeg",
      id: "6",
      name: "Home6",
      location: "Akota,Vadodara",
      price: "₹ 20L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      // image:
      // "https://raw.githubusercontent.com/Aryankumar011/Home_Finder_Assets/main/Images/img_1.jpeg",
      image: "assets/images/img_1.jpeg",
      id: "1",
      name: "Home1",
      location: "Karjan,Vadodara",
      price: "₹ 5L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_2.jpeg",
      id: "2",
      name: "Home2",
      location: "Makarpura,Vadodara",
      price: "₹ 4L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_3.jpeg",
      id: "3",
      name: "Home3",
      location: "Chhani,Vadodara",
      price: "₹ 15L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_4.jpeg",
      id: "4",
      name: "Home4",
      location: "Dabhoi,Vadodara",
      price: "₹ 20L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_5.jpeg",
      id: "5",
      name: "Home5",
      location: "Maneja,Vadodara",
      price: "₹ 15L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
  ProductModel(
      image: "assets/images/img_6.jpeg",
      id: "6",
      name: "Home6",
      location: "Akota,Vadodara",
      price: "₹ 20L",
      description:
          "Cozy two-bedroom home nestled in a quiet suburban neighborhood, featuring a spacious living room with large windows offering abundant natural light. Modern kitchen equipped with stainless steel appliances and granite countertops. Serene backyard with a lush garden and patio perfect for outdoor gatherings. Master bedroom with en-suite bathroom for added privacy. Conveniently located near schools, parks, and shopping centers.",
      isFavourite: false),
];

List<Map<String, dynamic>> categoriesList = [
  {"Name": "Apartment", "Source": "assets/Categories/Apartment.png"},
  {"Name": "Bungalow", "Source": "assets/Categories/Bungalow.png"},
  {"Name": "Farmhouse", "Source": "assets/Categories/Farmhouse.png"},
  {"Name": "Single", "Source": "assets/Categories/Single.png"},
  {"Name": "Townhouse", "Source": "assets/Categories/Townhouse.png"},
  {"Name": "Villa", "Source": "assets/Categories/Villa.png"},
];

var ArrData = [
  {"Name": "Apartment", "Source": "assets/Categories/Apartment.png"},
  {"Name": "Bungalow", "Source": "assets/Categories/Bungalow.png"},
  {"Name": "Farmhouse", "Source": "assets/Categories/Farmhouse.png"},
  {"Name": "Single", "Source": "assets/Categories/Single.png"},
  {"Name": "Townhouse", "Source": "assets/Categories/Townhouse.png"},
  {"Name": "Villa", "Source": "assets/Categories/Villa.png"},
];

List<String> categories = [
  // "D:/Flutter Project/Home_Finder_Assets/Categories/Apartment.png",
  // "assets/Categories/Apartment.png",
  "assets/Categories/Apartment.png",
  "assets/Categories/Bungalow.png",
  "assets/Categories/Farmhouse.png",
  "assets/Categories/Single.png",
  "assets/Categories/Townhouse.png",
  "assets/Categories/Villa.png",
];
