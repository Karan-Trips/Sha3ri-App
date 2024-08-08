import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final Map<String, bool> _switchStates = {
    'darkMode': false,
    'privateProfile': false,
  };
  Map<String, String> data = {
    Assets.block: "Block",
    Assets.key: "Change Password",
    Assets.change_lang: "Change Language",
  };
  Map<String, String> data2 = {
    Assets.star: "Rate App",
    Assets.send: "Share App",
    Assets.comment: "FAQ",
    Assets.term_cond: "Terms & Conditions",
    Assets.privacy: "Privacy Policy",
    Assets.about_us: "About Us",
    Assets.contact_us: "Contact Us",
  };
  Map<String, String> data3 = {
    Assets.delete: 'Delete Profile',
    Assets.logout: 'Logout',
  };
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Setting")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: 1.w,
                          color: AppColor.lightgrey,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(Assets.gift, height: 48.h, width: 48.w)
                              .wrapPaddingHorizontal(5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "40",
                                style: w700_22.copyWith(
                                    color: isDarkMode
                                        ? AppColor.white
                                        : AppColor.black),
                              ),
                              Text(
                                "My Gifts",
                                style: w400_14.copyWith(
                                    fontSize: 12.sp,
                                    color: isDarkMode
                                        ? AppColor.white
                                        : AppColor.black),
                              )
                            ],
                          )
                        ],
                      ),
                    ).wrapPaddingRight(15.w),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: 1.w,
                          color: AppColor.lightgrey,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(Assets.coin, height: 48.h, width: 48.w)
                              .wrapPaddingHorizontal(5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "100",
                                style: w700_22.copyWith(
                                    color: isDarkMode
                                        ? AppColor.white
                                        : AppColor.black),
                              ),
                              Text(
                                "Total Tokens",
                                style: w400_14.copyWith(
                                    fontSize: 12.sp,
                                    color: isDarkMode
                                        ? AppColor.white
                                        : AppColor.black),
                              ).wrapPaddingRight(15.w)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                boxContainer(
                  sufixIcon: true,
                  count: 'Subscribe to Premium',
                  image: Assets.prime,
                  showBackgroundColor: true,
                  imageSize: 36,
                  title: 'Expire in 2 days',
                  countTextStyle: w600_16,
                  titleTextStyle: w400_14,
                  backgroundColor: AppColor.blue,
                  padding: EdgeInsets.all(12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.blue, width: 1.w),
                ).wrapPaddingBottom(15.h),
                boxContainer(
                  key: 'darkMode',
                  sufixIcon: true,
                  count: 'Dark Mode',
                  image: Assets.dark_mode,
                  showBackgroundColor: true,
                  imageSize: 36,
                  title: 'Change theme to darkmode',
                  countTextStyle: w600_16,
                  titleTextStyle: w400_14,
                  backgroundColor: AppColor.lighYellow,
                  padding: EdgeInsets.all(12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.lighYellow, width: 1.w),
                ).wrapPaddingBottom(15.h),
                boxContainer(
                  key: 'privateProfile',
                  sufixIcon: true,
                  count: 'Private Profile',
                  image: Assets.private_profile,
                  showBackgroundColor: true,
                  imageSize: 36,
                  title: 'Manage profile private/public.',
                  countTextStyle: w600_16,
                  titleTextStyle: w400_14,
                  backgroundColor: AppColor.lighGreen,
                  padding: EdgeInsets.all(12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.lighGreen, width: 1.w),
                ).wrapPaddingBottom(15.h),
              ],
            ).wrapPaddingHorizontal(16.w).wrapPaddingAll(10.h),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var key = data.keys.elementAt(index);
                  var value = data.values.elementAt(index);
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          print(index);
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (index == 2)
                              Text(
                                "English",
                                style: w500_14.copyWith(
                                    fontSize: 16.sp, color: AppColor.blue),
                              ),
                            11.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18.sp,
                            )
                          ],
                        ),
                        leading: Image.asset(
                          key,
                          color: isDarkMode ? AppColor.white : AppColor.black,
                          height: 20.h,
                          width: 20.w,
                        ),
                        title: Text(value,
                            style: w600_16.copyWith(
                                color: isDarkMode
                                    ? AppColor.white
                                    : AppColor.black)),
                      ).wrapPaddingBottom(5.h),
                      if (data.length - 1 != index)
                        Divider(
                          thickness: 3.h,
                          color: AppColor.lightgrey.withOpacity(.20),
                        ).wrapPaddingOnly(left: 45.w, right: 25.w)
                    ],
                  );
                }).wrapPaddingHorizontal(15.w),
            Divider(
              thickness: 5.h,
              color: AppColor.lightgrey.withOpacity(.20),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var key = data2.keys.elementAt(index);
                var values = data2.values.elementAt(index);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text(values,
                          style: w500_14.copyWith(
                              color: isDarkMode
                                  ? AppColor.white
                                  : AppColor.black)),
                      leading: Image.asset(key,
                          color: isDarkMode ? AppColor.white : AppColor.black,
                          height: 20.h),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18.sp,
                      ),
                    ),
                    if (data2.length - 1 != index)
                      Divider(
                        thickness: 3.h,
                        color: AppColor.lightgrey.withOpacity(.20),
                      ).wrapPaddingOnly(left: 45.w, right: 25.w)
                  ],
                );
              },
              itemCount: data2.length,
            ).wrapPaddingHorizontal(15.w),
            Divider(
              thickness: 5.h,
              color: AppColor.lightgrey.withOpacity(.20),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var key = data3.keys.elementAt(index);
                var values = data3.values.elementAt(index);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text(values,
                          style: w500_14.copyWith(
                              color: isDarkMode
                                  ? AppColor.white
                                  : AppColor.black)),
                      leading: Image.asset(key,
                          color: isDarkMode ? AppColor.white : AppColor.black,
                          height: 20.h),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18.sp,
                      ),
                    ),
                    if (data2.length - 1 != index)
                      Divider(
                        thickness: 3.h,
                        color: AppColor.lightgrey.withOpacity(.20),
                      ).wrapPaddingOnly(left: 45.w, right: 25.w)
                  ],
                );
              },
              itemCount: data3.length,
            ).wrapPaddingHorizontal(15.w)
          ],
        ).wrapPaddingVertical(20.h),
      ),
    );
  }

  Container boxContainer({
    required String count,
    required String image,
    required bool showBackgroundColor,
    required double imageSize,
    required String title,
    required TextStyle countTextStyle,
    required TextStyle titleTextStyle,
    bool sufixIcon = false,
    String key = '',
    Color backgroundColor = AppColor.transparent,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10)),
    Border? border,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color textColor = backgroundColor == AppColor.blue
        ? AppColor.white
        : (isDarkMode
            ? (backgroundColor == Colors.transparent
                ? AppColor.black
                : AppColor.black)
            : (backgroundColor == Colors.transparent
                ? AppColor.black
                : AppColor.black));

    final Color borderColor = isDarkMode
        ? (backgroundColor == Colors.transparent
            ? AppColor.white
            : AppColor.black)
        : (backgroundColor == Colors.transparent
            ? AppColor.black
            : AppColor.white);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border ?? Border.all(width: 1, color: borderColor)),
      child: Row(
        children: [
          Image.asset(image, height: imageSize, width: imageSize)
              .wrapPaddingRight(9.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(count, style: countTextStyle.copyWith(color: textColor)),
              Text(title, style: titleTextStyle.copyWith(color: textColor)),
            ],
          ),
          const Spacer(),
          sufixIcon && backgroundColor != AppColor.blue
              ? Switch(
                  inactiveTrackColor: AppColor.lightgrey,
                  activeColor: key == 'darkMode'
                      ? AppColor.lightgrey
                      : AppColor.lightgrey,
                  inactiveThumbColor: key == 'darkMode'
                      ? AppColor.lighYellow
                      : AppColor.lighGreen,
                  value: _switchStates[key]!,
                  onChanged: (value) {
                    setState(() {
                      _switchStates[key] = value;
                      if (key == 'darkMode') {
                        themeNotifier.value =
                            value ? ThemeMode.dark : ThemeMode.light;
                      }
                    });
                  },
                )
              : sufixIcon
                  ? Icon(Icons.arrow_forward_ios, color: textColor)
                  : SizedBox.shrink(),
        ],
      ),
    );
  }
}
