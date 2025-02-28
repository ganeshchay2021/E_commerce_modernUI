import 'package:e_commerce_modernui/utils/assets.dart';

class ProductModel {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavourite;
  final String description;

  ProductModel(
      {required this.name,
      required this.category,
      required this.price,
      this.oldPrice,
      required this.imageUrl,
      this.isFavourite = false,
      required this.description});
}

final List<ProductModel> products = [
  ProductModel(
    name: "Shoes",
    category: "Footwear",
    price: 69.0,
    oldPrice: 189.0,
    imageUrl: Assets.shoe,
    description: "THis is the description of product 1",
  ),
  ProductModel(
    isFavourite: true,
    name: "Laptop",
    category: "Electronics",
    price: 69.0,
    oldPrice: 189.0,
    imageUrl: Assets.laptop,
    description: "THis is the description of product 2",
  ),
   ProductModel(
    name: "Jorden Shoes",
    category: "Footwear",
    price: 69.0,
    oldPrice: 189.0,
    imageUrl: Assets.shoe2,
    description: "THis is the description of product 3",
  ),
   ProductModel(
    name: "Puma",
    category: "Footwear",
    price: 69.0,
    oldPrice: 189.0,
    imageUrl: Assets.shoes2,
    description: "THis is the description of product 4",
  ),
];
