import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/export.dart';
import '../../../widget/notification_tiles.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationModel> notifications = [
    NotificationModel(
      profileImageUrl: Assets.followed_girl,
      name: 'Jimmy Nilson',
      action: 'followed you',
      timeAgo: '2 hours ago',
    ),
    NotificationModel(
      profileImageUrl: Assets.frd_req,
      name: 'Lloyd Williams',
      action: 'commented on your post',
      timeAgo: '2 hours ago',
    ),
    NotificationModel(
      profileImageUrl: Assets.nigga,
      name: 'Adam Hall',
      action: 'sent you follow request.',
      timeAgo: '2 hours ago',
      isRequest: true,
    ),
    NotificationModel(
      profileImageUrl: Assets.frd_req,
      name: 'Joaquin Littell',
      action: 'sent you follow request.',
      timeAgo: '2 hours ago',
      isRequest: true,
    ),
    NotificationModel(
      profileImageUrl: Assets.girl_nigga,
      name: 'Gregory Fowler',
      action: 'start a live now',
      timeAgo: '2 hours ago',
    ),
    NotificationModel(
      profileImageUrl: Assets.girl_nigga,
      name: 'Gregory Fowler',
      action: 'start a live now',
      timeAgo: '2 hours ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: w700_22.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ),
        backgroundColor: isDarkMode ? AppColor.black : AppColor.white,
        iconTheme:
            IconThemeData(color: isDarkMode ? AppColor.white : AppColor.black),
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: AppColor.lightgrey,
            height: 1.h,
          ).wrapPaddingVertical(7.h);
        },
        itemBuilder: (context, index) {
          return NotificationTile(
            notification: notifications[index],
          );
        },
      ).wrapPaddingHorizontal(16.w),
    );
  }
}
