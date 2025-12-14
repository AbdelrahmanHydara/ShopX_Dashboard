import 'dart:io';
import 'package:shopx_dashboard/features/add_product/data/models/review_model.dart';
import 'package:shopx_dashboard/features/add_product/entities/add_product_entity.dart';

class AddProductModel {
  final String code;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final int? discount;
  final File imageFile;
  final int? oldPrice;
  final List<ReviewModel> reviews;
  String? imageUrl;

  AddProductModel({
    this.imageUrl,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.reviews,
    required this.discount,
    required this.imageFile,
    required this.oldPrice,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      code: entity.code,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      quantity: entity.quantity,
      discount: entity.discount,
      imageFile: entity.imageFile,
      oldPrice: entity.oldPrice,
      imageUrl: entity.imageUrl,
      reviews: entity.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
    );
  }

  toMap() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'discount': discount,
      'imageUrl': imageUrl,
      'oldPrice': oldPrice,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}
