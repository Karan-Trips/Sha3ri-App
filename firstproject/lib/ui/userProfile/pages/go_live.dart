import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/locator/locator.dart';
import '../../../router/app_router.dart';

@RoutePage()
class GoLivePage extends StatefulWidget {
  const GoLivePage({super.key});

  @override
  State<GoLivePage> createState() => _GoLivePageState();
}

class _GoLivePageState extends State<GoLivePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkmode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          "Live(20)",
          style: w600_16.copyWith(
              color: isDarkmode ? AppColor.white : AppColor.black),
          softWrap: true,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => appRouter.push(SubscriptionRoute()),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.red),
              child: Row(
                children: [
                  Image.asset(Assets.radar, height: 23.h, width: 21.w)
                      .wrapPaddingRight(5.w),
                  Text("Go Live",
                      style: w600_16.copyWith(
                          color: AppColor.white, fontSize: 14.sp)),
                ],
              ).wrapPaddingSymmetric(horizontal: 7.w, vertical: 5.h),
            ).wrapPaddingRight(17.w),
          ),
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 211,
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (_) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          20.verticalSpace,
                          live_person().wrapPaddingBottom(20.h),
                          Text(
                            "Want to join Annie Ogawa live?",
                            style: w600_20.copyWith(
                                color: isDarkmode
                                    ? AppColor.white
                                    : AppColor.black),
                          ).wrapPaddingHorizontal(30.5.w),
                          20.verticalSpace,
                          AppButton(buttonColor: true, 'Join Request', () {
                            appRouter.popForced();
                            showModalBottomSheet(
                                showDragHandle: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (_) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      15.verticalSpace,
                                      Image.asset(
                                        isDarkmode
                                            ? Assets.white_logo
                                            : Assets.dark_logo,
                                        width: 109.w,
                                        height: 50.54.h,
                                      ),
                                      25.verticalSpace,
                                      Text(
                                        'Your join request has been sent. you will notified when he/she accept the request',
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        style: w600_20.copyWith(
                                            color: isDarkmode
                                                ? AppColor.white
                                                : AppColor.black),
                                      ).wrapPaddingHorizontal(6.w),
                                      25.verticalSpace,
                                      AppButton(
                                        'Ok',
                                        () {
                                          appRouter.popForced();
                                        },
                                        buttonColor: true,
                                      )
                                    ],
                                  ).wrapPaddingHorizontal(17.w);
                                });
                          }).wrapPaddingBottom(5.h),
                          AppButton('No,Thanks', () {}).wrapPaddingBottom(5.h),
                        ],
                      ).wrapPaddingHorizontal(17.w);
                    });
              },
              child: live_person(),
            );
          }).wrapPaddingHorizontal(15.w),
    );
  }

  Container live_person() {
    return Container(
      height: 211.h,
      width: 177.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          image: DecorationImage(
              image: AssetImage(Assets.gitar), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: AppColor.red),
                child: Row(
                  children: [
                    Image.asset(Assets.radar, height: 15.h, width: 15.w)
                        .wrapPaddingRight(2.w),
                    Text("Go Live",
                        style: w600_16.copyWith(
                            color: AppColor.white, fontSize: 10.sp)),
                  ],
                ).wrapPaddingSymmetric(horizontal: 3.w, vertical: 2.h),
              ).wrapPaddingOnly(top: 10.h, right: 10.w),
            ],
          ),
          Row(
            children: [
              Container(
                height: 21.h,
                width: 21.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(Assets.a1)),
                    border: Border.all(width: 2.w, color: AppColor.white)),
              ).wrapPaddingRight(5.w),
              Text(
                "Annie Ogawa",
                style: w500_14.copyWith(fontSize: 12.sp, color: AppColor.white),
              )
            ],
          ).wrapPaddingOnly(left: 9.w, bottom: 10.h),
        ],
      ),
    );
  }
}
