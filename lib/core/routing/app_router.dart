import 'package:flutter/material.dart';
import 'package:shopx_dashboard/features/add_product/screens/add_product_scrren.dart';
import 'package:shopx_dashboard/features/dashboard/screens/dashboard_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch(settings.name)
    {
      case Routes.dashboardScreen:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen()
        );
      case Routes.addProductScreen:
        return MaterialPageRoute(
            builder: (_) => const AddProductScreen()
        );
    }
    return null;
  }
}