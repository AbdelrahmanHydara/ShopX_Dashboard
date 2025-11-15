import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/components/custom_appbar.dart';
import 'package:shopx_dashboard/core/components/custom_button.dart';
import 'package:shopx_dashboard/core/components/custom_cupertino_text_field.dart';
import 'package:shopx_dashboard/core/components/custom_text.dart';
import 'package:shopx_dashboard/core/helpers/spacing.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final List<String> categories = const [
    'Electronics',
    'Clothing',
    'Home & Kitchen',
    'Books',
    'Other'
  ];
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final inputDecoration = BoxDecoration(
      color: appColors.primaryColor.withAlpha(50),
      borderRadius: BorderRadius.circular(8.r),
    );
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add New Product",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCupertinoTextField(
                  decoration: inputDecoration,
                  placeholder: 'Product Name',
                ),
                verticalSpace(16),
                CustomCupertinoTextField(
                  decoration: inputDecoration,
                  placeholder: 'Product Code / SKU',
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: CustomCupertinoTextField(
                        decoration: inputDecoration,
                        placeholder: 'Price (EGP)',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: CustomCupertinoTextField(
                        decoration: inputDecoration,
                        placeholder: 'Old Price (Optional)',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: CustomCupertinoTextField(
                        decoration: inputDecoration,
                        placeholder: 'Quantity',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: CustomCupertinoTextField(
                        decoration: inputDecoration,
                        placeholder: 'Discount (%)',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                TextWidgets.subHeading1(
                  'Product Category',
                  color: appColors.primaryColor,
                ),
                verticalSpace(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: inputDecoration,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: categories.first,
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ),
                ),
                verticalSpace(16),
                CustomCupertinoTextField(
                  decoration: inputDecoration,
                  placeholder: 'Product Description (Max 250 words)',
                  maxLines: 5,
                ),
                verticalSpace(20),
                TextWidgets.subHeading1(
                  'Product Image',
                  color: appColors.primaryColor,
                ),
                verticalSpace(8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColors.primaryColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: appColors.primaryColor,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.photo_on_rectangle,
                          color: appColors.primaryColor.withAlpha(100),
                          size: 40,
                        ),
                        verticalSpace(8),
                        Text(
                          'Tap to Select Image',
                          style: TextStyle(
                            color: appColors.primaryColor.withAlpha(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(30),
                CustomButton(
                  onPressed: () {},
                  text: "Upload Product",
                  height: 50.h,
                  textColor: appColors.secondaryColor,
                  backgroundColor: appColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
