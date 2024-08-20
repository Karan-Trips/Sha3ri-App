import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key, required this.image});
  final String image;

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late TextEditingController caption;
  @override
  void initState() {
    caption = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    caption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Color(0xffF5F6F7),
          centerTitle: true,
          title: Text("Create Post",
              style: isDarkMode
                  ? w600_16.copyWith(color: Colors.white)
                  : w600_16)),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter your post information",
                    textAlign: TextAlign.center,
                    style: isDarkMode
                        ? w600_20.copyWith(color: Colors.white)
                        : w600_20)
                .wrapPaddingHorizontal(68.w)
                .wrapPaddingTop(20.h),
            20.verticalSpace,
            Container(
                height: 340.h,
                width: 305.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  image: widget.image.isNotEmpty
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(widget.image)),
                        )
                      : null,
                )).wrapPaddingBottom(15.h),
            TextFormField(
                    autocorrect: true,
                    controller: caption,
                    maxLines: 4,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15.w, top: 15.h),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 10,
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color:
                                isDarkMode ? Colors.white54 : Color(0xffE7EBF0),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color:
                                isDarkMode ? Colors.white54 : Color(0xffE7EBF0),
                          ),
                        ),
                        hintText: 'Write a Post Description',
                        hintStyle: w600_16.copyWith(
                            color: isDarkMode
                                ? Colors.white70
                                : AppColor.lightgrey)))
                .wrapPaddingVertical(10.h),
            AppButton('Post', () {}, buttonColor: true)
                .wrapPaddingSymmetric(vertical: 1.h),
          ],
        ).wrapPaddingHorizontal(16.w),
      ),
    );
  }
}
