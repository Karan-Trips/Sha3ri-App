import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: w600_16.copyWith(
            color: isDarkMode ? AppColor.white : AppColor.black,
          ),
        ),
      ),
      body: Column(
        children: [
          20.verticalSpace,
          Center(
            child: Image.asset(
                isDarkMode ? Assets.white_logo : Assets.dark_logo,
                height: 60.h,
                width: 125.w),
          ).wrapPaddingBottom(20.h),
          Text(
            textAlign: TextAlign.center,
            "Please feel free to talk to us if you have anyquestions.We endeavour to answer within 24 hours.",
            style: w600_20.copyWith(
                color: isDarkMode ? AppColor.white : Color(0xff0B1120)),
          ).wrapPaddingBottom(20.h),
          AppTextField(label: 'First name', hint: 'First name')
              .wrapPaddingBottom(15.h),
          AppTextField(label: 'Last name', hint: 'Last name')
              .wrapPaddingBottom(15.h),
          AppTextField(label: 'Subject', hint: 'Subject')
              .wrapPaddingBottom(15.h),
          AppTextField(label: 'Message', hint: 'Message', maxLines: 4)
              .wrapPaddingBottom(15.h),
          Spacer(),
          AppButton('Submit', () {}, buttonColor: true).wrapPaddingBottom(18.h),
        ],
      ).wrapPaddingHorizontal(16.w),
    );
  }
}
