import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx_dashboard/core/services/get_it_service.dart';
import 'package:shopx_dashboard/core/theme/logic/theme_cubit.dart';
import 'package:shopx_dashboard/shpox_dashboard.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(BlocProvider(
          create: (_) => ThemeCubit(),
          child: const ShopXDashboard(),
      ));
}
