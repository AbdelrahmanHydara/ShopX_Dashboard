import 'package:dartz/dartz.dart';
import 'package:shopx_dashboard/core/errors/failures.dart';
import 'package:shopx_dashboard/features/add_product/entities/add_product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct({required AddProductEntity addProductEntity});
}