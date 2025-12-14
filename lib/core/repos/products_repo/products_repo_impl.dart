import 'package:dartz/dartz.dart';
import 'package:shopx_dashboard/core/errors/failures.dart';
import 'package:shopx_dashboard/core/helpers/end_point.dart';
import 'package:shopx_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:shopx_dashboard/core/services/data_service.dart';
import 'package:shopx_dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:shopx_dashboard/features/add_product/entities/add_product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  ProductsRepoImpl({required this.databaseServices});

  final DatabaseServices databaseServices;

  @override
  Future<Either<Failure, void>> addProduct({
    required AddProductEntity addProductEntity,
  }) async {
    try{
     await databaseServices.addData(
        data: AddProductModel.fromEntity(addProductEntity).toMap(),
       path: EndPoint.addProducts,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to add product"));
    }
  }
}
