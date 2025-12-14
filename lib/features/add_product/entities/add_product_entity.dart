import 'dart:io';

import 'package:shopx_dashboard/features/add_product/entities/review_entity.dart';

class AddProductEntity {
  final String code;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final int? discount;
  final File imageFile;
  final int? oldPrice;
  final String categoryId;
  final int ratingCount = 0;
  final int totalRating = 0;
  final List<ReviewEntity> reviews;
  String? imageUrl;

  AddProductEntity({
    this.discount,
    this.oldPrice,
    this.imageUrl,
    required this.code,
    required this.name,
    required this.reviews,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageFile,
    required this.categoryId,
  });
}