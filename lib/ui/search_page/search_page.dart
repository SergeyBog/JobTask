import 'package:flutter/material.dart';
import '../../utils/themes/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.2),
      body: const Center(
        child: Text(
          'Search Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColor.blackText,
          ),
        ),
      ),
    );
  }
}
