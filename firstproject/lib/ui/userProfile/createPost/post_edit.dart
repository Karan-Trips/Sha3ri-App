import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/export.dart';

@RoutePage()
class PostEditPage extends StatefulWidget {
  const PostEditPage({super.key, required this.photoPath});
  final String photoPath;

  @override
  State<PostEditPage> createState() => _PostEditPageState();
}

class _PostEditPageState extends State<PostEditPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: widget.photoPath.isNotEmpty
                ? Image.file(File(widget.photoPath))
                : Text('No photo available'),
          ),
          Positioned(
            bottom: 90.h,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(.25),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: TabBar(
                controller: _tabController,
                automaticIndicatorColorAdjustment: true,
                labelPadding: EdgeInsets.zero,
                labelColor: AppColor.black,
                dividerHeight: 0,
                unselectedLabelStyle: w400_16.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.spMin,
                    fontFamily: 'figtree_semibold'),
                onTap: (index) {},
                enableFeedback: true,
                labelStyle: w400_16.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.spMin,
                    fontFamily: 'figtree_semibold'),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: 'Text'),
                  Tab(text: 'Sticker'),
                  Tab(text: 'Music'),
                ],
              ).wrapPaddingAll(3),
            ).wrapPaddingHorizontal(75.w),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
                    'Next',
                    () => locator<AppRouter>()
                        .push(CreatePostRoute(image: widget.photoPath)),
                    buttonColor: true)
                .wrapPaddingAll(17.r),
          ),
        ],
      ),
    );
  }
}
