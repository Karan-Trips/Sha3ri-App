import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/ui/welcome_page/widgets/signup_bottomsheet.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'widgets/loginbottomsheet.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/image/main.mp4')
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
          });

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : Center(child: CircularProgressIndicator()),
          Container(color: Colors.black.withOpacity(0.3)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.spMax,
                      fontFamily: 'figtree_black',
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ).wrapPaddingBottom(7),
                RichText(
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Sha',
                          style: TextStyle(
                              color: AppColor.white,
                              fontFamily: 'figtree_black',
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: '3',
                          style: TextStyle(
                              color: AppColor.blue,
                              fontFamily: 'figtree_black',
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'ri',
                          style: TextStyle(
                              color: AppColor.white,
                              fontFamily: 'figtree_black',
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700)),
                    ])).wrapPaddingBottom(10),
                Text(
                  'When everything can be posted for free. Post every single thing you love here.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ).wrapPaddingBottom(20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.r)),
                        ),
                        transitionAnimationController: _animationController,
                        builder: (BuildContext context) {
                          return SignupBottomsheet();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r)),
                      padding: EdgeInsets.symmetric(vertical: 16.sp),
                    ),
                    child: Text(
                      'Create an Account',
                      style: textBold.copyWith(color: AppColor.white),
                    ),
                  ),
                ).wrapPaddingBottom(5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.r)),
                        ),
                        transitionAnimationController: _animationController,
                        builder: (BuildContext context) {
                          return LoginBottomSheet();
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      backgroundColor: AppColor.white,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Already have an account',
                      style: textBold.copyWith(color: AppColor.black),
                    ),
                  ),
                ).wrapPaddingVertical(7),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              'By continuing, you are agreeing to our company’s ',
                          style: TextStyle(color: AppColor.white)),
                      TextSpan(
                          text: 'Terms of service',
                          style: TextStyle(color: AppColor.blue)),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(color: AppColor.white)),
                      TextSpan(
                          text: 'Privacy policy',
                          style: TextStyle(color: AppColor.blue)),
                    ])).wrapPaddingVertical(20.h).wrapPaddingHorizontal(15.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
