import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_task/ui/main_page/widgets/custom_bottom_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/main_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    Future.microtask(() async => context.read<MainProvider>().setPageIndex(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
      ),
      child: Consumer<MainProvider>(
        builder: (_, MainProvider mainProvider, __) {
          return Scaffold(
            body: IndexedStack(
              index: mainProvider.currentPageIndex,
              children: mainProvider.pages,
            ),
            extendBody: true,
            backgroundColor: Colors.transparent,
            bottomNavigationBar: const CustomBottomBar(),
          );
        },
      ),
    );
  }
}