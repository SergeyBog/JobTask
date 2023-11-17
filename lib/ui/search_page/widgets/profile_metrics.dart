import 'package:flutter/material.dart';
import 'package:job_task/models/domain/user_prodile.dart';
import 'package:job_task/providers/search_page_provider.dart';
import 'package:provider/provider.dart';

class ProfileMetrics extends StatefulWidget {
  final UserProfile profile;

  const ProfileMetrics({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfileMetrics> createState() => _ProfileMetricsState();
}

class _ProfileMetricsState extends State<ProfileMetrics>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: context.read<SearchPageProvider>().animateDuration, value: 1);
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animationController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);
    _animationController.forward();
    super.initState();
  }

  Future<void> repeatOnce() async {
    _animationController.reset();
    await _animationController.forward();
    await _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<SearchPageProvider>().needToAnimate) {
      Future.microtask(() async => await repeatOnce());
    } else {
      _animationController.stop();
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.2),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _metric(
              title: widget.profile.followers.toString(),
              subtitle: 'followers',
              alignment: CrossAxisAlignment.start,
            ),
            _metric(
              title: widget.profile.postsAmount.toString(),
              subtitle: 'posts',
              alignment: CrossAxisAlignment.center,
            ),
            _metric(
              title: widget.profile.followed.toString(),
              subtitle: 'following',
              alignment: CrossAxisAlignment.end,
            ),
          ],
        ),
      ),
    );
  }

  Widget _metric({
    required String title,
    required String subtitle,
    required CrossAxisAlignment alignment,
  }) {
    return FadeTransition(
      opacity: _animationController,
      child: SlideTransition(
        position: _animOffset,
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
