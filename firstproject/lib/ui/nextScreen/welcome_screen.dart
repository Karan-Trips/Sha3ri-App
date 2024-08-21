import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/app_router.dart';
import '../../widget/button_widget.dart';

@RoutePage()
class NextScreenPage extends StatefulWidget {
  const NextScreenPage({super.key});

  @override
  State<NextScreenPage> createState() => _NextScreenPageState();
}

class _NextScreenPageState extends State<NextScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _topToBottomAnimation;
  late Animation<Offset> _bottomToTopAnimation;
  late Animation<Offset> _topBottomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _topToBottomAnimation = Tween<Offset>(
      begin: Offset(0, -0.5), // Start above the container
      end: Offset(0, 0.5), // End below the container
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _bottomToTopAnimation = Tween<Offset>(
      begin: Offset(0, 0.5), // Start below the container
      end: Offset(0, -0.5), // End above the container
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _topBottomAnimation = Tween<Offset>(
      begin: Offset(0, -0.5), // Start above the container
      end: Offset(0, 0.5), // End below the container
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : AppColor.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final containerColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final buttonColor = isDarkMode ? Colors.blue[300] : AppColor.blue;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            Center(
              child: Image.asset(
                isDarkMode ? Assets.white_logo : Assets.dark_logo,
                height: 57.71.h,
                width: 125.w,
              ),
            ).wrapPaddingVertical(29.h),
            Container(
              height: 330.h,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedBuilder(
                                  animation: _topToBottomAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _topToBottomAnimation.value,
                                      child: Image.asset(
                                        Assets.a1,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ).wrapPaddingBottom(20.h),
                                AnimatedBuilder(
                                  animation: _topToBottomAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _topToBottomAnimation.value,
                                      child: Image.asset(
                                        Assets.a3,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ).wrapPaddingBottom(20.h),
                                AnimatedBuilder(
                                  animation: _topToBottomAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _topToBottomAnimation.value,
                                      child: Image.asset(
                                        Assets.a2,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedBuilder(
                                  animation: _bottomToTopAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _bottomToTopAnimation.value,
                                      child: Image.asset(
                                        Assets.a3,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ).wrapPaddingBottom(20.h),
                                AnimatedBuilder(
                                  animation: _bottomToTopAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _bottomToTopAnimation.value,
                                      child: Image.asset(
                                        Assets.a1,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ).wrapPaddingBottom(20.h),
                                AnimatedBuilder(
                                  animation: _bottomToTopAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _bottomToTopAnimation.value,
                                      child: Image.asset(
                                        Assets.a2,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedBuilder(
                                  animation: _topBottomAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _topBottomAnimation.value,
                                      child:
                                          Image.asset(Assets.a2, height: 95.h),
                                    );
                                  },
                                ).wrapPaddingBottom(20.h),
                                AnimatedBuilder(
                                  animation: _topBottomAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _topBottomAnimation.value,
                                      child: Image.asset(
                                        Assets.a3,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ).wrapPaddingBottom(20.h),
                                AnimatedBuilder(
                                  animation: _topBottomAnimation,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: _topBottomAnimation.value,
                                      child: Image.asset(
                                        Assets.a1,
                                        height: 95.h,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).wrapPaddingHorizontal(20.w).wrapPaddingBottom(25.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Follow your ',
                style: textMedium.copyWith(
                    color: textColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                    text: 'favorite poets ',
                    style: textBold.copyWith(
                        color: buttonColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: 'and Get Latest update every day',
                    style: textBold.copyWith(
                        color: textColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ).wrapPaddingHorizontal(24.w).wrapPaddingBottom(10.h),
            Text(
              textAlign: TextAlign.center,
              "It is a long established fact that a reader will be distracted by the readable content.",
              style: textThin.copyWith(fontSize: 12.sp, color: textColor),
            ).wrapPaddingHorizontal(65.5.w),
            // Spacer(),
            AppButton(
              'Next',
              () {
                appRouter.pushAndPopUntil(WelcomeRoute(),
                    predicate: (_) => false);
              },
              buttonColor: true,
            ).wrapPaddingSymmetric(horizontal: 15.w, vertical: 18.h)
          ],
        ),
      ),
    );
  }
}
