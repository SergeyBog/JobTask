import 'package:flutter/material.dart';
import '../../../utils/themes/styles.dart';

class FollowButton extends StatefulWidget {

  const FollowButton({Key? key}) : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isStretched = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: _unfollowedButton(),
      secondChild: _followedButton(),
      crossFadeState: isStretched ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 350),
    );
  }

  Widget _unfollowedButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        side: const BorderSide(color: AppColor.primary, width: 1),
        foregroundColor: AppColor.primary,
      ),
      onPressed: () {
        setState(() {
          isStretched = false;
        });
      },
      child: const Text(
        'Follow',
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColor.primary,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _followedButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isStretched = true;
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primary,
        ),
        width: 48,
        height: 48,
        child: const Icon(Icons.person, color: Colors.white, size: 24),
      ),
    );
  }
}
