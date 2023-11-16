import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_task/utils/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      //systemNavigationBarColor: AppColor.bottomBarBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runAppWithProviders();
}