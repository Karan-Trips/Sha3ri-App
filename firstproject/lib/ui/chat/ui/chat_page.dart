import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/chat_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Map<String, String> users = {
    Assets.a1: "Merlene Woods",
    Assets.a2: "Jakob Calzoni",
    Assets.a3: "James George",
    Assets.girl_nigga: "Roger Press",
    Assets.cmt_boys: "Angel Madsen",
    Assets.coin: "Gretchen Gouse",
    Assets.cmt_girl: "Terry Korsgaard"
  };
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        shadowColor: AppColor.black.withOpacity(.09),
        actions: [
          Image.asset(
            Assets.search,
            height: 24.h,
            width: 24.w,
          ).wrapPaddingRight(16.w),
        ],
        title: Text(
          "Chat",
          softWrap: true,
          style: w700_22.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final image = users.keys.elementAt(index);
            final name = users.values.elementAt(index);
            return ChatmainPage(
                image: image, name: name, index: index, users: users);
          }),
    );
  }
}
