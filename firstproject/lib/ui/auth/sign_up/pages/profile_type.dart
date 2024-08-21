import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../../values/export.dart';
import '../../../../widget/button_widget.dart';

@RoutePage()
class ProfileTypePage extends StatefulWidget {
  const ProfileTypePage({super.key});

  @override
  State<ProfileTypePage> createState() => _ProfileTypePageState();
}

class _ProfileTypePageState extends State<ProfileTypePage> {
  bool _isPublic = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColor.black : Color(0xffF5F6F7);
    final cardColor = isDarkMode ? AppColor.black : AppColor.white;
    final textColor = isDarkMode ? AppColor.white : AppColor.black;
    final borderColor = isDarkMode ? AppColor.black : Color(0xffE7EBF0);
    final selectedColor = isDarkMode ? AppColor.blue : AppColor.blue;
    final subtitleColor = isDarkMode ? AppColor.grey : AppColor.grey;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text("Complete Profile",
              style: w600_16.copyWith(color: textColor)),
          centerTitle: true,
          backgroundColor: backgroundColor,
        ),
        body: Column(
          children: [
            40.verticalSpace,
            Text("Set your profile type Public/Private",
                    style: w600_20.copyWith(color: textColor))
                .wrapPaddingBottom(32.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1.w, color: borderColor),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    color: _isPublic ? selectedColor : cardColor,
                    child: RadioListTile<bool>(
                      value: true,
                      groupValue: _isPublic,
                      fillColor: WidgetStateProperty.all(AppColor.white),
                      onChanged: (val) {
                        setState(() {
                          _isPublic = val ?? true;
                        });
                      },
                      title: Text("Public",
                              style: w600_20.copyWith(
                                  color:
                                      _isPublic ? AppColor.white : textColor))
                          .wrapPaddingBottom(5.h),
                      subtitle: Text(
                        "You can view each other's full profile details and posts, chat directly with each other, and follow or unfollow each other as well.",
                        style: w400_16.copyWith(
                            fontSize: 12.spMin,
                            color: _isPublic ? AppColor.white : subtitleColor),
                      ).wrapPaddingBottom(10.h),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.r),
                    color: !_isPublic ? selectedColor : cardColor,
                    child: RadioListTile<bool>(
                      activeColor: AppColor.white,
                      value: false,
                      groupValue: _isPublic,
                      fillColor: WidgetStateProperty.all(AppColor.white),
                      onChanged: (val) {
                        setState(() {
                          _isPublic = val ?? false;
                        });
                      },
                      title: Text("Private",
                              style: w600_20.copyWith(
                                  color:
                                      !_isPublic ? AppColor.white : textColor))
                          .wrapPaddingBottom(10.h),
                      subtitle: Text(
                        "You can view each other's complete profile details but not their posts. To follow each other, a follow request must be sent and accepted, after which users can view each other's posts.",
                        style: w400_16.copyWith(
                            fontSize: 12.spMin,
                            color: !_isPublic ? AppColor.white : subtitleColor),
                      ).wrapPaddingBottom(10.h),
                    ),
                  ),
                ],
              ),
            ).wrapPaddingHorizontal(16.w),
            Spacer(),
            AppButton(
              'Submit',
              () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (_) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        30.verticalSpace,
                        Center(
                          child: Image.asset(
                            isDarkMode ? Assets.white_logo : Assets.dark_logo,
                            width: 110.w,
                            height: 50.78.h,
                          ),
                        ).wrapPaddingBottom(25.h),
                        Text(
                          textAlign: TextAlign.center,
                          "Your account created successfully!",
                          style: w600_20.copyWith(color: textColor),
                        ).wrapPaddingHorizontal(46.5.w).wrapPaddingBottom(25.h),
                        AppButton(
                          'Explore the App',
                          () => appRouter.pushAndPopUntil(
                            HomeRouteMain(),
                            predicate: (route) => false,
                          ),
                          buttonColor: true,
                        ).wrapPaddingHorizontal(16.w).wrapPaddingBottom(16.h),
                      ],
                    );
                  },
                );
              },
              buttonColor: true,
            ).wrapPaddingHorizontal(16.w).wrapPaddingBottom(20.h),
          ],
        ),
      ),
    );
  }
}
