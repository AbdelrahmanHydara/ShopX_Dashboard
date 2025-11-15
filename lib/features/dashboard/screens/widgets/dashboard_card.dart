import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/components/custom_container.dart';
import 'package:shopx_dashboard/core/components/custom_text.dart';
import 'package:shopx_dashboard/core/helpers/spacing.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        height: 150.h,
        decoration: BoxDecoration(
          color: appColors.primaryColor.withAlpha(50),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: appColors.primaryColor.withAlpha(100)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: appColors.primaryColor,
            ),
            verticalSpace(10),
            TextWidgets.subHeading1(
              title,
              color: appColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
