import 'package:flutter/cupertino.dart';
import 'package:job_task/ui/chat_page/chat_page.dart';
import 'package:job_task/ui/info_page/info_page.dart';
import 'package:job_task/ui/notification_page/notification_page.dart';

import '../ui/search_page/search_page.dart';

class MainProvider extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  final List<Widget> _pages = [
    const InfoPage(),
    const SearchPage(),
    const NotificationPage(),
    const ChatPage(),
  ];

  final List<String> _bottomBarItems = [
    'assets/images/bottom_bar/info.svg',
    'assets/images/bottom_bar/search.svg',
    '',
    'assets/images/bottom_bar/bell.svg',
    'assets/images/bottom_bar/chat.svg',
  ];

  List<String> get bottomBarItems => _bottomBarItems;

  List<Widget> get pages => _pages;

  void setPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
