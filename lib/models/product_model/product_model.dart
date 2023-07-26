import 'package:default_project/models/product_model/rating_model.dart';

class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  RatingModel rating;

  ProductModel({
    required this.category,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      category: json['category'],
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'],
    );
  }

  Map<String,dynamic> toJson()=>{
    "category":category,
    "image":image,
  };
}
