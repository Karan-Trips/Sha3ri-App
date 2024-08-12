import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/export.dart';

@RoutePage()
class BlockUserPage extends StatefulWidget {
  const BlockUserPage({super.key});

  @override
  State<BlockUserPage> createState() => _BlockUserPageState();
}

class _BlockUserPageState extends State<BlockUserPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: isDarkMode ? Color(0xff0A0908) : Color(0xffF5F6F7),
              prefixIcon: Icon(
                Icons.search,
                color: AppColor.lightgrey,
              ),
              hintText: 'Search',
              hintStyle: w400_14.copyWith(color: AppColor.lightgrey),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ).wrapPaddingHorizontal(16.w),
        ),
        title: Text("Block User"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 24.r,
              backgroundImage: AssetImage(Assets.gitar),
            ),
            title: Text(
              "Barbara Gills",
              style: w600_16.copyWith(
                  fontSize: 14.sp,
                  color: isDarkMode ? AppColor.white : AppColor.black),
            ),
            subtitle: Text(
              "@rose",
              style: w400_14.copyWith(
                  fontSize: 12.sp,
                  fontStyle: FontStyle.italic,
                  color: isDarkMode ? Color(0xff7E6D61) : AppColor.lightgrey),
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(vertical: 7.5.h, horizontal: 19.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                      width: 1.w,
                      color: isDarkMode ? AppColor.white : AppColor.black)),
              child: Text(
                "Unblock",
                style: w500_14.copyWith(
                    color: isDarkMode ? AppColor.white : AppColor.black),
              ),
            ),
          );
        },
      ).wrapPaddingSymmetric(vertical: 20.h, horizontal: 16.w),
    );
  }
}
