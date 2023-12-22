import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel(
      {required this.image,
      required this.id,
      required this.name,
      required this.location,
      required this.price,
      required this.description,
      required this.isFavourite,
      this.qty});

  String image;
  String id;
  bool isFavourite;
  String name;
  String price;
  String description;
  String location;

  int? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isFavourite: false,
        location: json["location"],
        qty: json["qty"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "isFavourite": isFavourite,
        "price": price,
        "location": location,
        "qty": qty
      };
  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        location: location,
        id: id,
        name: name,
        description: description,
        image: image,
        isFavourite: isFavourite,
        qty: qty ?? this.qty,
        price: price,
      );
}
