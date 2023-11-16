import 'package:flutter/material.dart';
import 'package:job_task/providers/home_provider.dart';
import 'package:job_task/providers/main_provider.dart';
import 'package:provider/provider.dart';
import '../app.dart';

void runAppWithProviders() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const App(),
    ),
  );
}