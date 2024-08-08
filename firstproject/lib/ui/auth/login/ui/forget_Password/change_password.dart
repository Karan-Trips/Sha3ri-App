import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/ui/auth/store/auth_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change Password",
          style: w600_16.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ),
      ),
      body: Column(
        children: [
          40.verticalSpace,
          Text(
            softWrap: true,
            textAlign: TextAlign.center,
            "Your new password must be different from previously used passwords.",
            style: w600_20.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          ),
          20.verticalSpace,
          Observer(
            builder: (_) => AppTextField(
              label: 'password',
              hint: 'Current password',
              obscureText: !authStore.isCurrentPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: authStore.toggleCurrentPasswordVisibility,
                child: Icon(
                  authStore.isCurrentPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColor.blue,
                ),
              ),
            ).wrapPaddingBottom(15.h),
          ),
          Observer(
            builder: (_) => AppTextField(
              keyboardType: TextInputType.visiblePassword,
              label: 'new password',
              hint: 'New password',
              obscureText: !authStore.isNewPasswordVisible,
              suffixIcon: GestureDetector(
                onTap: authStore.toggleNewPasswordVisibility,
                child: Icon(
                  authStore.isNewPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColor.blue,
                ),
              ),
            ).wrapPaddingBottom(15.h),
          ),
          Observer(
            builder: (_) => AppTextField(
              keyboardType: TextInputType.visiblePassword,
              label: 'password',
              keyboardAction: TextInputAction.done,
              obscureText: !authStore.isConfirmPasswordVisible,
              hint: 'Confirm password',
              suffixIcon: GestureDetector(
                onTap: authStore.toggleConfirmPasswordVisibility,
                child: Icon(
                    authStore.isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: authStore.isConfirmPasswordVisible
                        ? AppColor.blue
                        : AppColor.lightgrey),
              ),
            ).wrapPaddingBottom(15.h),
          ),
          Spacer(),
        ],
      ).wrapPaddingHorizontal(16.w),
    );
  }
}
