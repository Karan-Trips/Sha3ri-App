import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/image/main.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0),
                      Color.fromRGBO(0, 0, 0, 0.8),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => appRouter.maybePop(),
                          child: Container(
                            padding: EdgeInsets.all(7.r),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.white.withOpacity(.15)),
                            child: Icon(Icons.close),
                          ),
                        )
                      ],
                    ).wrapPaddingTop(25.h),
                    Image.asset(
                      Assets.white_logo,
                      height: 57.71.h,
                      width: 125.w,
                    ).wrapPaddingBottom(20.h),
                    Text(
                      "Subscribe to Premium",
                      style: w700_22.copyWith(color: AppColor.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Manage your subscription Easy and Fast",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ).wrapPaddingSymmetric(horizontal: 16.w, vertical: 20.h),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromRGBO(0, 0, 0, 0),
                        Color.fromRGBO(0, 0, 0, 1),
                      ])),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "Experience our live streaming feature & enjoy",
                        style: w700_22.copyWith(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontFamily: 'figtree_extraBold'),
                        textAlign: TextAlign.center,
                      ).wrapPaddingHorizontal(21.w),
                      SizedBox(height: 20.h),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: AppColor.lightgrey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.r,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '1 Months',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    '\$10.99 /',
                                    style: w700_22.copyWith(
                                        fontSize: 18.sp, color: AppColor.blue),
                                  ),
                                  Text(
                                    "month",
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.h, horizontal: 7.w),
                              decoration: BoxDecoration(
                                color: AppColor.blue,
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.r,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '7 day free Trail',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.white,
                                    ),
                                  ).wrapPaddingVertical(3.h),
                                  Container(
                                    decoration:
                                        BoxDecoration(color: AppColor.black),
                                    child: Column(
                                      children: [
                                        Text(
                                          '12 Months',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                            color: AppColor.white,
                                          ),
                                        ),
                                        Text(
                                          '\$99.99 /',
                                          style: w400_16.copyWith(
                                              fontSize: 18.sp,
                                              color: AppColor.blue),
                                        ),
                                        Text(
                                          "years",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.white),
                                        ).wrapPaddingBottom(7.h),
                                        Text("(\$19.00 / month)",
                                            style: w400_14)
                                      ],
                                    ).wrapPaddingAll(6.r),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: AppColor.lightgrey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.r,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '6 Months',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    '\$50.99 /',
                                    style: w700_22.copyWith(
                                        fontSize: 18.sp, color: AppColor.blue),
                                  ),
                                  Text(
                                    "month",
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ]).wrapPaddingBottom(7.h),
                      SizedBox(height: 20.h),
                      Text(
                        "\$228 billed yearly after 7-days free trial.",
                        style: w500_14.copyWith(
                            fontSize: 16.sp, color: AppColor.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Cancel anytime during trial",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'figtree_medium'),
                        textAlign: TextAlign.center,
                      ).wrapPaddingBottom(26.h),
                      AppButton(
                        "Subscribe Now",
                        () {},
                        buttonColor: true,
                      ).wrapPaddingBottom(10.h),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Restore Purchase",
                                style: w400_14.copyWith(
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Terms of Service",
                                style: w400_14.copyWith(
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Privacy Policy",
                                style: w400_14.copyWith(
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    ],
                  ).wrapPaddingHorizontal(16.w),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
