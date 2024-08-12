import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key, required this.title});
  final String title;
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: w600_16.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              style: w500_14.copyWith(
                  color: isDarkMode ? AppColor.white : AppColor.black),
            ).wrapPaddingBottom(10.h),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              style: w500_14.copyWith(
                  color: isDarkMode ? Color(0xffEAE3DF) : Color(0xff151C20)),
            ).wrapPaddingBottom(14.h),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              style: w500_14.copyWith(
                  color: isDarkMode ? Color(0xffEAE3DF) : Color(0xff151C20)),
            ).wrapPaddingBottom(14.h),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
              style: w500_14.copyWith(
                  color: isDarkMode ? Color(0xffEAE3DF) : Color(0xff151C20)),
            ).wrapPaddingBottom(14.h),
          ],
        ).wrapPaddingSymmetric(vertical: 20.h, horizontal: 16.w),
      ),
    );
  }
}
