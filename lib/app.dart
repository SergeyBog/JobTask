import 'package:flutter/material.dart';
import 'package:job_task/ui/main_page/main_page.dart';
import 'package:job_task/utils/themes/light_theme.dart';

class App extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const App({super.key});

  static BuildContext get globalContext => navigatorKey.currentState!.context;

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'job_task',
      navigatorKey: App.navigatorKey,
      theme: LightTheme.themeData,
      themeMode: ThemeMode.light,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      home: const MainPage(),
    );
  }
}