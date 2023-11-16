import 'package:flutter/material.dart';
import 'package:job_task/providers/main_provider.dart';
import 'package:job_task/providers/search_page_provider.dart';
import 'package:provider/provider.dart';
import '../app.dart';

void runAppWithProviders() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => SearchPageProvider()),
      ],
      child: const App(),
    ),
  );
}