import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/components/custom_text.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key, required this.title}) : preferredSize = const Size.fromHeight(50);
  final String title;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon (
          Icons.arrow_back_ios_new,
          color: appColors.primaryColor,
          size: 20.sp,
        ),
      ),
      centerTitle: true,
      title: TextWidgets.subHeading(
        title,
        color: appColors.primaryColor,
      ),
    );
  }
}