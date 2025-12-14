import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:shopx_dashboard/core/errors/failures.dart';
import 'package:shopx_dashboard/core/helpers/end_point.dart';
import 'package:shopx_dashboard/core/services/storage_service.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  ImagesRepoImpl({required this.storageService});

  final StorageService storageService;

  @override
  Future<Either<Failure, String>> uploadImage({required File image}) async {
    try {
      String url = await storageService.uploadFile(
        file: image,
        path: EndPoint.images,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to upload image'));
    }
  }
}
