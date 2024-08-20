import 'package:auto_route/auto_route.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_image.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/locator/locator.dart';
import '../../../generated/assets.dart';
import '../../../router/app_router.dart';
import '../../../values/export.dart';

@RoutePage()
class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned.fill(
              child: CameraAwesomeBuilder.awesome(
            theme: AwesomeTheme(
                bottomActionsBackgroundColor: AppColor.transparent),
            bottomActionsBuilder: (state) {
              return Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 42.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Image.asset(Assets.send,
                                      height: 22.h, width: 22.w)
                                  .wrapPaddingOnly(
                                      right: 18.w, top: 10.h, bottom: 10.h)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r)),
                          hintText: "Type comment here...",
                          filled: true,
                          fillColor: AppColor.white.withOpacity(.28)),
                    ).wrapPaddingRight(19.w),
                  ),
                ),
                Badge(
                    largeSize: 18.r,
                    backgroundColor: AppColor.blue,
                    label: Text("3",
                        style: w500_14.copyWith(
                            fontSize: 13.spMin, color: AppColor.white)),
                    child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColor.white),
                        child: Image.asset(Assets.gift,
                            height: 30.h, width: 30.w)))
              ]).wrapPaddingSymmetric(horizontal: 17.w, vertical: 10.h);
            },
            middleContentBuilder: (state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "Morbius Box Office: Jared Leto’s Film Is Towards Marvel’s 4th Lowest Opening ...#live",
                          style: w400_16.copyWith(
                              fontFamily: 'figtree_semibold',
                              color: AppColor.white,
                              fontSize: 12.sp),
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 122.h,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 40,
                              left: 0,
                              child: AppImage(
                                assets: Assets.giftBox,
                                height: 21.h,
                                width: 21.w,
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 0,
                              child: AppImage(
                                assets: Assets.giftBox,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: AppImage(
                                assets: Assets.giftBox,
                                height: 14.74.h,
                                width: 14.74.w,
                              ),
                            ),
                            Positioned(
                              bottom: 60.h,
                              left: 20.w,
                              child: AppImage(
                                assets: Assets.giftBox,
                                height: 10.h,
                                width: 10.w,
                              ),
                            ),
                            Positioned(
                              bottom: 32,
                              left: 26.w,
                              child: AppImage(
                                assets: Assets.giftBox2,
                                height: 18.08.h,
                                width: 18.08.w,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 29.w,
                              child: AppImage(
                                assets: Assets.giftBox2,
                                height: 14.74.h,
                                width: 14.74.w,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ).wrapPaddingOnly(left: 16.w, right: 5.w);
            },
            topActionsBuilder: (state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 9.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColor.black.withOpacity(.20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            Assets.gitar,
                          ),
                        ).wrapPaddingRight(8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kristi Lopez',
                              style: w400_16.copyWith(
                                  color: AppColor.white,
                                  fontSize: 15.spMin,
                                  fontFamily: 'figtree_light'),
                            ).wrapPaddingBottom(3.h),
                            Row(
                              children: [
                                Icon(Icons.visibility_outlined,
                                        size: 16.w, color: AppColor.white)
                                    .wrapPaddingRight(4.w),
                                Text(
                                  "420",
                                  style: w500_14.copyWith(
                                      color: AppColor.white,
                                      fontSize: 12.spMax),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Badge(
                              label: Text("3"),
                              textStyle: w500_14.copyWith(fontSize: 13.spMax),
                              textColor: AppColor.white,
                              backgroundColor: AppColor.blue,
                              child: Image.asset(Assets.addFrd,
                                  height: 24.h, width: 24.w))
                          .wrapPaddingRight(19.w),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              builder: (context) =>
                                  OptionSheet().wrapPaddingHorizontal(16.w));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white.withOpacity(0.15),
                          ),
                          child: Image.asset(Assets.close,
                              height: 10.h, width: 10.w),
                        ),
                      ),
                    ],
                  )
                ],
              ).wrapPaddingTop(25.h).wrapPaddingHorizontal(17.w);
            },
            saveConfig: SaveConfig.video(
              mirrorFrontCamera: false,
              videoOptions: VideoOptions(
                enableAudio: true,
                quality: VideoRecordingQuality.uhd,
                ios: CupertinoVideoOptions(
                  fps: 60,
                ),
                android: AndroidVideoOptions(
                  bitrate: 6000000,
                  fallbackStrategy: QualityFallbackStrategy.lower,
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }

  Column OptionSheet() {
    final isDarkmode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        15.verticalSpace,
        AppImage(
          assets: isDarkmode ? Assets.white_logo : Assets.dark_logo,
          height: 50.h,
          width: 110.w,
        ),
        25.verticalSpace,
        Text(
          "Do you want to stop live?",
          style: w600_20.copyWith(
              color: isDarkmode ? AppColor.white : AppColor.black),
        ),
        20.verticalSpace,
        AppButton(
          'Yes',
          () {
            locator<AppRouter>().popAndPush(HomeRouteMain());
          },
          buttonColor: true,
        ).wrapPaddingBottom(5.h),
        AppButton(
          'No,Thanks',
          () {},
        ).wrapPaddingBottom(5.h),
      ],
    );
  }
}
