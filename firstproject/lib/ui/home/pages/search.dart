import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/export.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            title: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
              spellCheckConfiguration: SpellCheckConfiguration(),
              decoration: InputDecoration(
                hintStyle: w400_16.copyWith(
                  color: isDarkMode ? Color(0xffB0B0B0) : Color(0xff7E879F),
                  fontFamily: 'figtree_regular',
                ),
                fillColor: isDarkMode ? Color(0xff1F1F1F) : Color(0xffF5F6F7),
                filled: true,
                suffixIcon: Icon(
                  Icons.close,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                hintText: "Search",
              ),
            ).wrapPaddingRight(15.w),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: TabBar(
                automaticIndicatorColorAdjustment: true,
                labelPadding: EdgeInsets.zero,
                labelColor: AppColor.white,
                dividerHeight: 0,
                unselectedLabelStyle: w400_16.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.spMin,
                  color: isDarkMode ? AppColor.lightgrey : AppColor.black,
                  fontFamily: 'figtree_semibold',
                ),
                enableFeedback: true,
                labelStyle: w400_16.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.spMin,
                  fontFamily: 'figtree_semibold',
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                unselectedLabelColor:
                    isDarkMode ? Colors.white70 : Colors.black54,
                tabs: [
                  Tab(text: 'Poets'),
                  Tab(text: 'Posts'),
                ],
              ).wrapPaddingHorizontal(109.w),
            ),
          ),
          body: TabBarView(
            children: [
              // Tab 1: Poets
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 24.r,
                      backgroundImage: AssetImage(Assets.cmt_boys),
                    ).wrapPaddingRight(12.w),
                    title: Text(
                      "Justin Aminoff",
                      style: w600_16.copyWith(
                        fontSize: 14.sp,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      "@rose",
                      style: w400_16.copyWith(
                        fontSize: 12.sp,
                        fontStyle: FontStyle.italic,
                        color: isDarkMode ? Colors.grey : Colors.black54,
                      ),
                    ),
                  ).wrapPaddingBottom(15.h);
                },
              ).wrapPaddingTop(15.h),
              // Tab 2: Posts
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(Assets.cmt_boys),
                    ),
                    title: Text(
                      "Sample Post Title",
                      style: w600_16.copyWith(
                        fontSize: 14.sp,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      "Post subtitle here",
                      style: w400_16.copyWith(
                        fontSize: 12.sp,
                        color: isDarkMode ? Colors.grey : Colors.black54,
                      ),
                    ),
                  );
                },
              ),
            ],
          ).wrapPaddingHorizontal(16.w),
        ),
      ),
    );
  }
}
