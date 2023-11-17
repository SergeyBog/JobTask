import 'package:flutter/material.dart';
import 'package:job_task/ui/search_page/widgets/profile_metrics.dart';
import 'package:provider/provider.dart';
import '../../../models/domain/user_prodile.dart';
import '../../../providers/search_page_provider.dart';
import '../../../utils/themes/styles.dart';
import 'follow_button.dart';

class ProfileInfo extends StatefulWidget {
  final UserProfile profile;

  const ProfileInfo({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: context.read<SearchPageProvider>().animateDuration,
        value: 1);
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
    return Consumer<SearchPageProvider>(
      builder: (_, SearchPageProvider searchPageProvider, __) {
        return Column(
          children: [
            ProfileMetrics(profile: widget.profile),
            GestureDetector(
              onPanUpdate: (details) async {
                if (details.delta.dy > 0) {
                  searchPageProvider.setDefaultSize();
                } else {
                  searchPageProvider.setExpandedSize();
                }
              },
              child: AnimatedContainer(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Color.fromRGBO(242, 242, 242, 1.0),
                ),
                height: searchPageProvider.profileHeight,
                width: MediaQuery.of(context).size.width,
                duration: const Duration(milliseconds: 350),
                child: _profileInfo(searchPageProvider: searchPageProvider),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _profileInfo({required SearchPageProvider searchPageProvider}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _animationController,
              child: SlideTransition(
                position: _animOffset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.profile.userName ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColor.blackText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.profile.location ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColor.blackText,
                          ),
                        ),
                      ],
                    ),
                    const FollowButton(),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: searchPageProvider.expanded ? 1 : 0,
              duration: const Duration(milliseconds: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.profile.profileDescription ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColor.blackText,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _profilePictures(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profilePictures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColor.blackText,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3,
          child: ListView.separated(
            itemCount: widget.profile.photos?.length ?? 0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  widget.profile.photos?[index] ?? '',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }
}
