import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_image.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool _isPasswordVisible = false;
  bool _isPasswordVisible2 = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _togglePasswordVisibility2() {
    setState(() {
      _isPasswordVisible2 = !_isPasswordVisible2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColor.black : AppColor.white;
    final textColor = isDarkMode ? AppColor.white : AppColor.black;
    final iconColor = isDarkMode ? AppColor.white : AppColor.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: iconColor,
            )),
        title: Text(
          "Reset Password",
          style: w600_16.copyWith(color: textColor),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Text(
            "Your new password must be different from previoulsy used password. ",
            style: w600_20.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ).wrapPaddingHorizontal(9.w).wrapPaddingBottom(20.h),
          AppTextField(
            contentPadding: EdgeInsets.only(left: 20.w),
            label: 'New Password',
            hint: 'New Password',
            obscureText: !_isPasswordVisible,
            suffixIcon: GestureDetector(
              onTap: _togglePasswordVisibility,
              child: Image.asset(
                _isPasswordVisible ? Assets.show : Assets.hide,
                height: 24.h,
                width: 24.w,
                color: iconColor,
              ).wrapPaddingOnly(top: 15.h, right: 20.w, bottom: 15.h),
            ),
            keyboardType: TextInputType.visiblePassword,
            keyboardAction: TextInputAction.next,
            validators: newPasswordValidator,
          ).wrapPaddingBottom(15.h),
          AppTextField(
            contentPadding: EdgeInsets.only(left: 20.w),
            label: 'Confirm Password',
            hint: 'Confirm Password',
            obscureText: !_isPasswordVisible2,
            suffixIcon: GestureDetector(
              onTap: _togglePasswordVisibility2,
              child: Image.asset(
                _isPasswordVisible2 ? Assets.show : Assets.hide,
                height: 24.h,
                width: 24.w,
                color: iconColor,
              ).wrapPaddingOnly(top: 15.h, right: 20.w, bottom: 15.h),
            ),
            keyboardType: TextInputType.visiblePassword,
            keyboardAction: TextInputAction.next,
            validators: confPasswordValidator,
          ),
          Spacer(),
          AppButton(buttonColor: true, 'Update', () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImage(
                          assets:
                              isDarkMode ? Assets.white_logo : Assets.dark_logo,
                          height: 50.78.h,
                          width: 110.w)
                      .wrapPaddingVertical(25.h),
                  Text(
                    "Password successfully changed!",
                    textAlign: TextAlign.center,
                    style: w600_20.copyWith(color: textColor),
                  ).wrapPaddingSymmetric(horizontal: 47.w, vertical: 25.h),
                  AppButton(
                    buttonColor: true,
                    'Back To login',
                    () => appRouter.popUntilRoot(),
                  ).wrapPaddingOnly(bottom: 10.h, left: 16.w, right: 16.w)
                ],
              ),
            );
          }).wrapPaddingBottom(26.h)
        ],
      ).wrapPaddingHorizontal(15.w),
    );
  }
}
