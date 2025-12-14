import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/helpers/spacing.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';
import 'package:shopx_dashboard/features/add_product/cubit/add_product_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageField extends StatelessWidget {
  const CustomImageField({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final cubit = context.read<AddProductCubit>();
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AddProductImageLoadingState,
          child: GestureDetector(
            onTap: () => cubit.selectImage(),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appColors.primaryColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: appColors.primaryColor,
                    ),
                  ),
                  child: cubit.productImageFile != null ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                        cubit.productImageFile!, fit: BoxFit.contain),
                  ) :
                  SizedBox(
                    height: 150.h,
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
                Visibility(
                  visible: cubit.productImageFile != null,
                  child: IconButton(
                    onPressed: cubit.closeImage,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
