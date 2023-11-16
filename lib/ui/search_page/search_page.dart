import 'package:flutter/material.dart';
import 'package:job_task/models/domain/user_prodile.dart';
import 'package:job_task/providers/search_page_provider.dart';
import 'package:provider/provider.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return Consumer<SearchPageProvider>(
      builder: (_, SearchPageProvider searchPageProvider, __) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                controller: searchPageProvider.pageController,
                onPageChanged: searchPageProvider.setNewCurrentPage,
                children: List<Widget>.generate(
                  searchPageProvider.pages.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: _profileCard(profile: searchPageProvider.pages[index]),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _profileCard({required UserProfile profile}) {
    return Image.asset(profile.profilePicture ?? '', width:  MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover,);
  }
}
