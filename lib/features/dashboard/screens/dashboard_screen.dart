import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx_dashboard/core/helpers/extensions.dart';
import 'package:shopx_dashboard/core/routing/routes.dart';
import 'widgets/dashboard_appbar.dart';
import 'widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 16.h,
          childAspectRatio: 2.5,
          children: [
            DashboardCard(
              icon: CupertinoIcons.cloud_upload,
              title: "Upload New Product",
              onTap: () => context.pushNamed(Routes.addProductScreen),
            ),
            DashboardCard(
              icon: CupertinoIcons.cube_box,
              title: "Manage Products",
              onTap: () {},
            ),
            DashboardCard(
              icon: CupertinoIcons.bag,
              title: "Manage Orders",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}