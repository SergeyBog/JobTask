import 'package:flutter/material.dart';
import '../../utils/themes/styles.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.3),
      body: const Center(
        child: Text(
          'Info Page',
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
