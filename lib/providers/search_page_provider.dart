import 'package:flutter/cupertino.dart';
import 'package:job_task/models/domain/user_prodile.dart';
import '../app.dart';

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
      profilePicture: 'assets/images/search_page/profile1.jpg',
      photos: [
        'assets/images/search_page/profile1.jpg',
        'assets/images/search_page/profile2.jpg',
        'assets/images/search_page/profile3.jpg',
        'assets/images/search_page/profile1.jpg',
      ],
    ),

    UserProfile(
      userName: 'Sergey Bohachenkoss',
      followers: 745,
      followed: 12,
      location: 'Ukraine, Kiev',
      profileDescription: 'Flutted Developer reallyss',
      postsAmount: 4,
      profilePicture: 'assets/images/search_page/profile2.jpg',
      photos: [
        'assets/images/search_page/profile2.jpg',
        'assets/images/search_page/profile1.jpg',
        'assets/images/search_page/profile3.jpg',
        'assets/images/search_page/profile2.jpg',
      ],
    ),

    UserProfile(
      userName: 'Sergey Bohachenkoss',
      followers: 745,
      followed: 12,
      location: 'Ukraine, Kiev',
      profileDescription: 'Flutted Developer reallyss',
      postsAmount: 4,
      profilePicture: 'assets/images/search_page/profile3.jpg',
      photos: [
        'assets/images/search_page/profile3.jpg',
        'assets/images/search_page/profile2.jpg',
        'assets/images/search_page/profile1.jpg',
        'assets/images/search_page/profile3.jpg',
      ],
    ),
  ];

  double _profileHeight = MediaQuery.of(App.globalContext).size.height * 0.18;

  double get profileHeight => _profileHeight;

  double _imageHeight = MediaQuery.of(App.globalContext).size.height * 0.76;

  double get imageHeight => _imageHeight;

  double _imageScale = 1.25;

  double get imageScale => _imageScale;

  bool _expanded = false;

  bool get expanded => _expanded;

  bool needToAnimate = false;

  Duration animateDuration = const Duration(milliseconds: 450);

  List<UserProfile> get pages => _pages;

  int currentPageIndex = 0;

  void setNewCurrentPage(int value) async {
    currentPageIndex = value;
    setDefaultSize();
    setNeedToAnimate(true);
    await Future.delayed(animateDuration);
    setNeedToAnimate(false);
  }

  void setNeedToAnimate(bool value) {
    needToAnimate = value;
    notifyListeners();
  }

  void setDefaultSize({bool needNotify = true}) {
    _profileHeight = (MediaQuery.of(App.globalContext).size.height * 0.18);
    _imageHeight = (MediaQuery.of(App.globalContext).size.height * 0.76);
    _imageScale = 1.25;
    _expanded = false;
    if (needNotify) {
      notifyListeners();
    }
  }

  void setExpandedSize({bool needNotify = true}) {
    _profileHeight = (MediaQuery.of(App.globalContext).size.height * 0.42);
    _imageHeight = (MediaQuery.of(App.globalContext).size.height * 0.6);
    _imageScale = 1;
    _expanded = true;
    if (needNotify) {
      notifyListeners();
    }
  }
}
