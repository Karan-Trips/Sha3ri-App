import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../auth/store/auth_store.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final Map<String, bool> _switchStates = {
    'darkMode': true,
    'privateProfile': false,
  };
  Map<String, String> data = {
    Assets.block: "Block User",
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
                    GestureDetector(
                      onTap: () => locator<AppRouter>().push(MyGiftRoute()),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 15.w),
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
                    ),
                    GestureDetector(
                      onTap: () => locator<AppRouter>().push(TokensRoute()),
                      child: Container(
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
                    ),
                  ],
                ),
                15.verticalSpace,
                GestureDetector(onTap: ()=>appRouter.push(SubscriptionRoute()),
                  child: boxContainer(
                    
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
                ),
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
                          if (index == 0) {
                            locator<AppRouter>().push(BlockUserRoute());
                          } else if (index == 1) {
                            locator<AppRouter>().push(ChangePasswordRoute());
                          } else if (index == 2) {
                            locator<AppRouter>().push(ChangeLanguageRoute());
                          }
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (index == 2)
                              Observer(builder: (_) {
                                return Text(
                                  authStore.selectedLanguageName,
                                  style: w500_14.copyWith(
                                      fontSize: 16.sp, color: AppColor.blue),
                                );
                              }),
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
                      onTap: () {
                        switch (index) {
                          case 2:
                            locator<AppRouter>().push(FAQRoute());
                            break;
                          case 3:
                            locator<AppRouter>().push(
                                AboutUsRoute(title: 'Terms & Conditions'));
                            break;
                          case 4:
                            locator<AppRouter>()
                                .push(AboutUsRoute(title: 'Privacy Policy'));
                            break;
                          case 5:
                            locator<AppRouter>()
                                .push(AboutUsRoute(title: 'About Us'));
                            break;
                          case 6:
                            locator<AppRouter>().push(ContactUsRoute());
                            break;
                          default:
                            break;
                        }
                      },
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
                      onTap: () {
                        switch (index) {
                          case 0:
                            showModalBottomSheet(
                                context: context,
                                showDragHandle: true,
                                isScrollControlled: true,
                                builder: (context) {
                                  return deleteProfile(isDarkMode)
                                      .wrapPaddingHorizontal(17.w);
                                });
                            break;
                          case 1:
                            showModalBottomSheet(
                                context: context,
                                showDragHandle: true,
                                isScrollControlled: true,
                                builder: (context) {
                                  return logout(isDarkMode)
                                      .wrapPaddingHorizontal(17.w);
                                });
                            break;

                          default:
                            break;
                        }
                      },
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

  Column logout(bool isDarkMode) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        10.verticalSpace,
        Center(
          child: Image.asset(
            isDarkMode ? Assets.white_logo : Assets.dark_logo,
            height: 51.h,
            width: 110.w,
          ),
        ).wrapPaddingBottom(25.h),
        Text(
          textAlign: TextAlign.center,
          "Are you sure want to delete profile from this App?",
          style: w600_20.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ).wrapPaddingHorizontal(30.w),
        20.verticalSpace,
        AppButton('Yes, Logout', () {}, buttonColor: true),
        AppButton('No, Thanks', () {}),
      ],
    );
  }

  Column deleteProfile(bool isDarkMode) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        10.verticalSpace,
        Center(
          child: Image.asset(
            isDarkMode ? Assets.white_logo : Assets.dark_logo,
            height: 51.h,
            width: 110.w,
          ),
        ).wrapPaddingBottom(25.h),
        Text(
          textAlign: TextAlign.center,
          "Are you sure want to delete profile from this App?",
          style: w600_20.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ).wrapPaddingHorizontal(30.w),
        20.verticalSpace,
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1.w,
                color: AppColor.lightgrey.withOpacity(.20),
              ),
            ),
            child: Observer(builder: (_) {
              return Column(
                  children: List.generate(3, (index) {
                final titles = ["Waste of time", "Not Useful", "Other"];
                final value = index + 1;
                return RadioListTile(
                    activeColor: AppColor.blue,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: value,
                    groupValue: authStore.selectedValue,
                    onChanged: (int? val) {
                      authStore.selectRadio(val ?? 0);
                    },
                    title: Text(
                      titles[index],
                      style: w500_14.copyWith(
                          color: isDarkMode ? AppColor.white : AppColor.black),
                    ));
              }));
            })).wrapPaddingBottom(10.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColor.red, borderRadius: BorderRadius.circular(8.r)),
          child: Center(
            child: Text(
              "Yes, Delete",
              style: w600_16.copyWith(fontSize: 14.sp, color: AppColor.white),
            ),
          ),
        ).wrapPaddingBottom(5.h),
        Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                    color: AppColor.transparent,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                    child: Text("No, Thanks",
                        style: w600_16.copyWith(
                            fontSize: 14.sp,
                            color:
                                isDarkMode ? AppColor.white : AppColor.black))))
            .wrapPaddingBottom(5.h),
      ],
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
                  inactiveTrackColor: AppColor.primaryColor,
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
