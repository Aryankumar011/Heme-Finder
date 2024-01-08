import 'package:flutter/material.dart';
import 'package:home_finder_new/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';
import 'package:home_finder_new/models/user_model/user_model.dart';

// Cart Working....
class AppProvider with ChangeNotifier {
  UserModel? _userModel;
  UserModel get getUserInformation => _userModel    !;
  List<ProductModel> _cartProductList = [];
  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getcartProductList => _cartProductList;

  /// Favourite Working...

  List<ProductModel> _favoriteProductList = [];
  void addFavoriteProduct(ProductModel productModel) {
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavoriteProduct(ProductModel productModel) {
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavoriteProductList => _favoriteProductList;

  /// User Information
  ///
  void getUserInfoFirebase() async {
    _userModel = await FirebaseFirestoreHelper.instance.getUserInformation();
    notifyListeners();
  }
}
