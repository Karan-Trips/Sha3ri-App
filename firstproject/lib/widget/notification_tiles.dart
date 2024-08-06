import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/export.dart';

class NotificationModel {
  final String profileImageUrl;
  final String name;
  final String action;
  final String timeAgo;
  final bool isRequest;

  NotificationModel({
    required this.profileImageUrl,
    required this.name,
    required this.action,
    required this.timeAgo,
    this.isRequest = false,
  });
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(notification.profileImageUrl),
        radius: 25.r,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: notification.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AppColor.white : AppColor.black),
            ),
            TextSpan(
              text: ' ${notification.action}',
              style: TextStyle(
                  color: isDarkMode ? AppColor.white : AppColor.black),
            ),
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (notification.isRequest)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                  child: Text("Reject",
                      style: w400_14.copyWith(
                          color: isDarkMode ? AppColor.white : AppColor.black)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                          width: 1,
                          color: isDarkMode ? AppColor.white : AppColor.black)),
                ),
                SizedBox(width: 8),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                  child: Text("Accept", style: w400_14),
                  decoration: BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(width: 1)),
                ),
              ],
            ).wrapPaddingTop(5.h),
          Text(notification.timeAgo).wrapPaddingVertical(5.h),
        ],
      ),
    );
  }
}
