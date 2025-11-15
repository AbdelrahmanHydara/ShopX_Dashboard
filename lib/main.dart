import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx_dashboard/core/theme/logic/theme_cubit.dart';
import 'package:shopx_dashboard/shpox_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
      BlocProvider(
          create: (_) => ThemeCubit(),
          child: const ShopXDashboard(),
      ),
  );
}
