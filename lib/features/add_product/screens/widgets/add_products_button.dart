import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/components/custom_button.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';
import 'package:shopx_dashboard/features/add_product/cubit/add_product_cubit.dart';
import 'package:shopx_dashboard/features/add_product/entities/add_product_entity.dart';

class AddProductsButton extends StatelessWidget {
  const AddProductsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cubit = context.read<AddProductCubit>();
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        final bool isLoading = state is AddProductLoading;
        return CustomButton(
          onPressed: isLoading
              ? null : () {
            if (cubit.productImageFile != null) {
              if (cubit.formKey.currentState!.validate()) {
                cubit.formKey.currentState!.save();
                AddProductEntity newProduct = AddProductEntity(
                  code: cubit.code,
                  name: cubit.name,
                  reviews: [],
                  description: cubit.description,
                  price: cubit.price,
                  quantity: cubit.quantity,
                  discount: cubit.discount,
                  imageFile: cubit.productImageFile!,
                  oldPrice: cubit.oldPrice,
                  categoryId: cubit.selectedCategoryId!,
                );
                cubit.addProduct(addProductEntity: newProduct);
              } else {
                cubit.changeAutoValidateMode();
              }
            }
          },
          text: isLoading ? "Loading...!" :"Add Product",
          height: 50.h,
          textColor: appColors.secondaryColor,
          backgroundColor:  isLoading ? Colors.green.shade200 : appColors.primaryColor,
        );
      },
    );
  }
}
