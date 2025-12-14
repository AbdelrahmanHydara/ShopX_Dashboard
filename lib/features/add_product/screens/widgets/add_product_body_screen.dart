import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/components/custom_text.dart';
import 'package:shopx_dashboard/core/helpers/spacing.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';
import 'package:shopx_dashboard/features/add_product/screens/widgets/add_products_button.dart';
import 'choose_categories.dart';
import 'custom_image_field.dart';
import 'form_field_add_products.dart';

class AddProductBodyScreen extends StatelessWidget {
  const AddProductBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormFieldAddProducts(),
            verticalSpace(16),
            TextWidgets.subHeading1(
              'Product Category',
              color: appColors.primaryColor,
            ),
            verticalSpace(8),
            const ChooseCategories(),
            verticalSpace(16),
            TextWidgets.subHeading1(
              'Product Image',
              color: appColors.primaryColor,
            ),
            verticalSpace(8),
            const CustomImageField(),
            verticalSpace(30),
            const AddProductsButton(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
