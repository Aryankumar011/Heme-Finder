import 'package:flutter/material.dart';
import 'package:home_finder_new/widgets/favourite/single_favourite_screen.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: Text("My Favourite homes"),
        ),
        body: appProvider.getFavoriteProductList.isEmpty
            ? Center(
                child: Text("No Favourite Homes Found...."),
              )
            : ListView.builder(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return SingleFavouritetItem(
                    singleProduct: appProvider.getFavoriteProductList[index],
                  );
                },
                itemCount: appProvider.getFavoriteProductList.length,
              ));
  }
}
