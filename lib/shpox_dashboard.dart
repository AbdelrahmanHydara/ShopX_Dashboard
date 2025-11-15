import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/logic/theme_cubit.dart';
import 'core/theme/logic/theme_state.dart';

class ShopXDashboard extends StatelessWidget {

  const ShopXDashboard({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 820),
      minTextAdapt: true,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final theme = (state as ThemeInitial).themeData;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: Routes.dashboardScreen,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}