import 'package:flutter/material.dart';
import 'package:home_finder_new/models/product_model/product_model.dart';

// Cart Working....
class AppProvider with ChangeNotifier {
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
}
