import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/export.dart';

@RoutePage()
class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "FAQ",
            style: w600_16.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColor.lightgrey,
                ),
                hintText: 'Search',
                hintStyle: w400_14.copyWith(color: AppColor.lightgrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ).wrapPaddingHorizontal(16.w),
          ),
          centerTitle: true),
      body: ListView.builder(
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text("${index + 1}. What Is Sha3ri?"),
                  children: [
                    Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                      softWrap: true,
                      style: w400_14.copyWith(
                          fontSize: 12.sp, color: AppColor.lightgrey),
                    ),
                  ],
                  controlAffinity: ListTileControlAffinity.trailing,
                );
              },
              itemCount: 3)
          .wrapPaddingAll(16.r),
    );
  }
}
