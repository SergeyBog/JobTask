import 'package:flutter/material.dart';
import '../../utils/themes/styles.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.2),
      body: const Center(
        child: Text(
          'Chat Page',
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
