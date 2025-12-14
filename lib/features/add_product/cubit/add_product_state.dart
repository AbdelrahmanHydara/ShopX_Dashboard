part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductAutoValidateModeState extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductFailure extends AddProductState {
  final String errorMessage;

    AddProductFailure({required this.errorMessage});
  }

final class AddProductImageRemovedState extends AddProductState {}

final class AddProductImageLoadingState extends AddProductState {}

final class AddProductImageSelectedState extends AddProductState {
  final File imageFile;

  AddProductImageSelectedState({required this.imageFile});
}

final class AddProductImageFailureState extends AddProductState {
  final String errorMessage;

    AddProductImageFailureState({required this.errorMessage});
}

final class AddProductCategoriesLoadingState extends AddProductState {}
