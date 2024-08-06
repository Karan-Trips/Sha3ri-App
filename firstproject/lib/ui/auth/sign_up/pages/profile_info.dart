import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/button_widget.dart';

@RoutePage()
class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController introController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    introController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColor.black : Color(0xffF5F6F7);
    final textColor = isDarkMode ? AppColor.white : AppColor.black;

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
        body: ListView(
          children: [
            40.verticalSpace,
            Text(
              "Please provide your Information about yourself.",
              style: w600_20.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ).wrapPaddingHorizontal(36.w).wrapPaddingBottom(30.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    label: 'First Name',
                    controller: firstNameController,
                    hint: 'First Name',
                    keyboardAction: TextInputAction.next,
                    textStyle: w600_16.copyWith(color: textColor),
                    contentPadding: EdgeInsets.only(left: 20.w),
                    validators: firstNameValidator,
                  ).wrapPaddingBottom(15.h),
                  AppTextField(
                    label: 'Last Name',
                    validators: lastNameValidator,
                    controller: lastNameController,
                    textStyle: w600_16.copyWith(color: textColor),
                    keyboardAction: TextInputAction.next,
                    hint: 'Last Name',
                    contentPadding: EdgeInsets.only(left: 20.w),
                  ).wrapPaddingBottom(15.h),
                  AppTextField(
                    label: 'UserName',
                    controller: userNameController,
                    hint: 'UserName',
                    validators: nameValidator,
                    textStyle: w600_16.copyWith(color: textColor),
                    keyboardAction: TextInputAction.next,
                    contentPadding: EdgeInsets.only(left: 20.w),
                  ).wrapPaddingBottom(15.h),
                  AppTextField(
                    keyboardAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    controller: introController,
                    maxLines: 4,
                    textStyle: w600_16.copyWith(color: textColor),
                    label: 'Write a short introduction',
                    hint: 'Write a short introduction',
                    contentPadding: EdgeInsets.only(left: 20.w, top: 25.h),
                  ).wrapPaddingBottom(15.h),
                ],
              ).wrapPaddingHorizontal(17.w),
            ),
            Spacer(),
            AppButton(
              'Next',
              () {
                context.router.push(ProfileTypeRoute());
              },
              buttonColor: true,
              // textColor: isDarkMode ? AppColor.darkButtonText : AppColor.primaryText,
            ).wrapPaddingHorizontal(16.w).wrapPaddingBottom(20.h),
          ],
        ),
      ),
    );
  }
}
