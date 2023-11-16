import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../providers/main_provider.dart';
import '../../../utils/themes/styles.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (_, MainProvider mainProvider, __) {
        return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 3),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: _bottomBarRow(context: context, mainProvider: mainProvider),
            )
        );
      },
    );
  }

  Widget _bottomBarRow(
      {required BuildContext context, required MainProvider mainProvider}) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: Platform.isIOS ? 20 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < mainProvider.bottomBarItems.length; i++) ...[
            i != 2 ? _tab(
              context: context,
              imagePath: mainProvider.bottomBarItems[i],
              tabIndex: i,
              mainProvider: mainProvider,
            ) : _centralButton()
          ],
        ],
      ),
    );
  }

  Widget _tab({
    required BuildContext context,
    required String imagePath,
    required int tabIndex,
    required MainProvider mainProvider,
  }) {
    return IconButton(
      padding: const EdgeInsets.only(top: 5),
      iconSize: 70,
      splashColor: Colors.transparent,
      onPressed: () => mainProvider.setPageIndex(tabIndex > 2 ? tabIndex - 1 : tabIndex),
      icon: Container(
        padding: const EdgeInsets.only(bottom: 3),
        child: SvgPicture.asset(
          imagePath,
          colorFilter: ColorFilter.mode(
            mainProvider.currentPageIndex != (tabIndex > 2 ? tabIndex - 1 : tabIndex)
                ? AppColor.blackText
                : AppColor.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _centralButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.primary,
        boxShadow: [
          BoxShadow(color: AppColor.primary.withOpacity(0.3), spreadRadius: 1, blurRadius: 10),
        ],
      ),
      width: 56,
      height: 56,
      child: const Center(
        child: Icon(Icons.add,color: Colors.white, size: 40),
      ),
    );
  }
}
