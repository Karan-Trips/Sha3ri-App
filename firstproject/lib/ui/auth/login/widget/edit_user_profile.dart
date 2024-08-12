import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditUserProfilePage extends StatefulWidget {
  const EditUserProfilePage({super.key});

  @override
  State<EditUserProfilePage> createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Edit Profile",
            softWrap: true,
            style: w600_16.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          )),
      body: Column(
        children: [
          40.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            "Please update your information if any changes are needed.",
            style: w600_20.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          ).wrapPaddingBottom(25.h).wrapPaddingHorizontal(19.w),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(width: 1.w, color: AppColor.lightgrey)),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.w),
                alignLabelWithHint: true,
                labelText: "First Name",
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ).wrapPaddingHorizontal(17.w),
    );
  }
}
