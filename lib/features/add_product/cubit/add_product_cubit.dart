import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopx_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shopx_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:shopx_dashboard/features/add_product/data/models/category_model.dart';
import 'package:shopx_dashboard/features/add_product/entities/add_product_entity.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  final formKey = GlobalKey<FormState>();
  late String name, code, description;
  late double price;
  late int quantity, discount;
  int? oldPrice;
  File? productImageFile;
  String? selectedCategoryId;

  // Add Product
  Future<void> addProduct({required AddProductEntity addProductEntity}) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(
      image: addProductEntity.imageFile,
    );
    result.fold(
      (failure) {
        emit(AddProductFailure(errorMessage: failure.message));
      },
      (imageUrl) async {
        addProductEntity.imageUrl = imageUrl;
        var addResult = await productsRepo.addProduct(
          addProductEntity: addProductEntity,
        );
        addResult.fold(
          (failure) {
            emit(AddProductFailure(errorMessage: failure.message));
          },
          (Success) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }

  bool isLoading = false;

  Future<void> prickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    productImageFile = File(image!.path);
  }

  Future<void> selectImage() async {
    emit(AddProductImageLoadingState());
    try {
      await prickImage();
      if (productImageFile != null) {
        emit(AddProductImageSelectedState(imageFile: productImageFile!));
      } else {
        emit(AddProductInitial());
      }
    } catch (e) {
      emit(AddProductImageFailureState(errorMessage: 'Failed to pick image'));
    }
  }

  void closeImage() {
    productImageFile = null;
    emit(AddProductImageRemovedState());
  }

  final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Electronics'),
    CategoryModel(id: '2', name: 'Clothing'),
    CategoryModel(id: '3', name: 'Home & Kitchen'),
    CategoryModel(id: '4', name: 'Books'),
    CategoryModel(id: '5', name: 'Other'),
  ];

  void updateSelectedCategory(String? newCategoryId) {
    selectedCategoryId = newCategoryId;
    emit(AddProductCategoriesLoadingState());
  }

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(AddProductAutoValidateModeState());
  }
}
