import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';
import 'package:shopx_dashboard/features/add_product/cubit/add_product_cubit.dart';

class ChooseCategories extends StatelessWidget {
  const ChooseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cubit = context.read<AddProductCubit>();
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: appColors.primaryColor.withAlpha(50),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: cubit.categories
                  .firstWhere(
                    (category) => category.id == cubit.selectedCategoryId,
                orElse: () => cubit.categories.first,
              )
                  .id,
              items: cubit.categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category.id,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                cubit.updateSelectedCategory(newValue!);
              },
            ),
          ),
        );
      },
    );
  }
}
