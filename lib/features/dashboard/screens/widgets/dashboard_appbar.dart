import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/theme/app_colors.dart';
import 'package:shopx_dashboard/core/theme/logic/theme_cubit.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const DashboardAppBar({super.key}) : preferredSize = const Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Text(
        "Dashboard",
        style: TextStyle(
          color: appColors.primaryColor,
          fontSize: 26.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          color: appColors.primaryColor,
          icon: const Icon(
              CupertinoIcons.brightness_solid,
          ),
          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
        ),
      ],
    );
  }
}