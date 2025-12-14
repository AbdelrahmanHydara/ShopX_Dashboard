import 'package:get_it/get_it.dart';
import 'package:shopx_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shopx_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:shopx_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:shopx_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:shopx_dashboard/core/services/data_service.dart';
import 'package:shopx_dashboard/core/services/fire_storage_service.dart';
import 'package:shopx_dashboard/core/services/firestore_service.dart';
import 'package:shopx_dashboard/core/services/storage_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FireStorageService());
  getIt.registerSingleton<DatabaseServices>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(
    storageService: getIt<StorageService>(),
  ));
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
    databaseServices: getIt<DatabaseServices>(),
  ));
}