import 'package:flutter/cupertino.dart';
import 'package:job_task/models/domain/user_prodile.dart';

class SearchPageProvider extends ChangeNotifier {

  final PageController pageController = PageController();

  final List<UserProfile> _pages = [
    UserProfile(
      userName: 'Sergey Bohachenko',
      followers: 946,
      followed: 145,
      location: 'Ukraine, Kiev',
      profileDescription: 'Flutted Developer really',
      postsAmount: 10,
      profilePicture: 'assets/images/search_page/profile1.png',
      photos: [

      ],
    ),
    UserProfile(
      userName: 'Sergey Bohachenkoss',
      followers: 745,
      followed: 12,
      location: 'Ukraine, Kiev',
      profileDescription: 'Flutted Developer reallyss',
      postsAmount: 4,
      profilePicture: 'assets/images/search_page/profile1.png',
      photos: [

      ],
    ),
  ];

  List<UserProfile> get pages => _pages;

  int currentPageIndex = 0;

  void setNewCurrentPage(int value) {
    currentPageIndex = value;
    notifyListeners();
  }
}