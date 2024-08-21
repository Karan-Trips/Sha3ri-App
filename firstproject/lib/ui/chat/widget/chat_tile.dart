import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/locator/locator.dart';
import '../../../router/app_router.dart';

class ChatmainPage extends StatelessWidget {
  const ChatmainPage({
    super.key,
    required this.image,
    required this.name,
    required this.index,
    required this.users,
  });

  final String image;
  final String name;
  final int index;
  final Map<String, String> users;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        ListTile(
          onTap: () {
            appRouter.push(ChatDetailsRoute(
              chatId: index,
              chatName: name,
              chatImage: image,
              status: true,
            ));
          },
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage(image),
          ),
          title: Text(
            name,
            style: w600_16.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          ).wrapPaddingBottom(5.h),
          subtitle: Text(
            "Hey! How's it going?",
            style: w400_14.copyWith(color: AppColor.lightgrey, fontSize: 12.sp),
          ),
          isThreeLine: true,
          trailing: Text(
            "04:04 am",
            style: w400_14.copyWith(color: AppColor.lightgrey, fontSize: 12.sp),
          ),
        ),
        if (users.length - 1 != index) Divider().wrapPaddingVertical(5.h),
      ],
    );
  }
}
