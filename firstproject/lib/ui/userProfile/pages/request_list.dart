import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RequestListPage extends StatefulWidget {
  const RequestListPage({super.key});

  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Requests",
          style: w600_16.copyWith(
            color: isDarkMode ? AppColor.white : AppColor.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.r),
                color: isDarkMode ? Color(0xff0A0908) : Color(0xffF5F6F7)),
            child: TabBar(
              labelStyle: w500_14,
              unselectedLabelStyle:
                  w400_14.copyWith(fontSize: 12.sp, color: AppColor.lightgrey),
              dividerColor: AppColor.transparent,
              labelColor: AppColor.white,
              indicator: BoxDecoration(
                  border: Border.all(color: AppColor.blue),
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.blue),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [Tab(text: "Received Request"), Tab(text: "Sent Request")],
            ),
          ).wrapPaddingHorizontal(17.w),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRequestList(
            isDarkMode,
            "Reject",
            isDarkMode ? AppColor.white : AppColor.black,
            "Accept",
            AppColor.blue,
          ),
          _buildRequestList(
            isDarkMode,
            "Cancel",
            isDarkMode ? AppColor.white : AppColor.black,
            "Requested",
            AppColor.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildRequestList(
    bool isDarkMode,
    String leftButtonText,
    Color leftButtonTextColor,
    String rightButtonText,
    Color rightButtonColor,
  ) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildRequestTile(
          isDarkMode,
          leftButtonText,
          leftButtonTextColor,
          rightButtonText,
          rightButtonColor,
        );
      },
    );
  }

  Widget _buildRequestTile(
    bool isDarkMode,
    String leftButtonText,
    Color leftButtonTextColor,
    String rightButtonText,
    Color rightButtonColor,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(Assets.a1),
        radius: 24.r,
      ),
      title: Text(
        "John Smith",
        style: w600_16.copyWith(
          fontSize: 14.sp,
          color: isDarkMode ? AppColor.white : AppColor.black,
        ),
      ),
      subtitle: Text(
        "@rose",
        style: w400_14.copyWith(
          fontSize: 12.sp,
          color: AppColor.lightgrey,
          fontStyle: FontStyle.italic,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildActionButton(leftButtonText, leftButtonTextColor)
              .wrapPaddingRight(10.w),
          _buildActionButton(rightButtonText, AppColor.white,
              backgroundColor: rightButtonColor),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    Color textColor, {
    Color backgroundColor = Colors.transparent,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
            width: 1.w,
            color: backgroundColor == AppColor.blue
                ? AppColor.transparent
                : AppColor.white),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
      child: Text(
        text,
        style: w500_14.copyWith(color: textColor),
      ),
    );
  }
}
