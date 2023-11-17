import 'package:flutter/material.dart';
import 'package:job_task/models/domain/user_prodile.dart';
import 'package:job_task/providers/search_page_provider.dart';
import 'package:job_task/ui/search_page/widgets/profile_info.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
      body: _body(),
    );
  }

  Widget _body() {
    return Consumer<SearchPageProvider>(
      builder: (_, SearchPageProvider searchPageProvider, __) {
        return SafeArea(
          child: Stack(
            children: [
              AnimatedContainer(
                height: searchPageProvider.imageHeight,
                width: MediaQuery.of(context).size.width,
                duration: const Duration(milliseconds: 250),
                child: PageView(
                  controller: searchPageProvider.pageController,
                  onPageChanged: searchPageProvider.setNewCurrentPage,
                  children: List<Widget>.generate(
                    searchPageProvider.pages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: _profileImage(
                        profile: searchPageProvider.pages[index],
                        scale: searchPageProvider.imageScale,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.cancel_outlined,
                          size: 32,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  ProfileInfo(
                      profile: searchPageProvider
                          .pages[searchPageProvider.currentPageIndex]),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _profileImage({required UserProfile profile, required double scale}) {
    return Image.asset(
      profile.profilePicture ?? '',
      fit: BoxFit.cover,
      scale: scale,
    );
  }
}
