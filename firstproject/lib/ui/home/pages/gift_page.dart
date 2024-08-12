import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/export.dart';
import 'stickers.dart';

// @RoutePage()
class GiftPage extends StatefulWidget {
  const GiftPage({super.key});

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;
  final List<List<Map<String, dynamic>>> tabItems = [
    [
      {'asset': Assets.nice_work, 'coins': 25},
      {'asset': Assets.awesome, 'coins': 50},
      {'asset': Assets.great_job, 'coins': 75},
      {'asset': Assets.well_done, 'coins': 100},
      {'asset': Assets.nice_work, 'coins': 25},
      {'asset': Assets.awesome, 'coins': 50},
      {'asset': Assets.great_job, 'coins': 75},
      {'asset': Assets.well_done, 'coins': 100},
      {'asset': Assets.well_done, 'coins': 100},
    ],
    [
      {'asset': Assets.awesome, 'coins': 50},
      {'asset': Assets.great_job, 'coins': 75},
      {'asset': Assets.well_done, 'coins': 100},
    ],
    [
      {'asset': Assets.nice_work, 'coins': 25},
      {'asset': Assets.awesome, 'coins': 50},
      {'asset': Assets.great_job, 'coins': 75},
    ],
    [
      {'asset': Assets.awesome, 'coins': 50},
      {'asset': Assets.great_job, 'coins': 75},
    ],
    [
      {'asset': Assets.nice_work, 'coins': 25},
      {'asset': Assets.awesome, 'coins': 50},
    ],
  ];

  late List<List<bool>> selectedItems;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController2 = TabController(length: 2, vsync: this);
    selectedItems = List.generate(
      tabItems.length,
      (index) => List.generate(tabItems[index].length, (itemIndex) => false),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  void _onItemTapped(int tabIndex, int itemIndex) {
    setState(() {
      selectedItems[tabIndex][itemIndex] = !selectedItems[tabIndex][itemIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.name,
                spellCheckConfiguration: SpellCheckConfiguration(),
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: EdgeInsets.zero,
                  iconColor: AppColor.primaryColor,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(
                        width: 1.w, color: Color(0xff81929E).withOpacity(.20)),
                  ),
                  fillColor: AppColor.transparent,
                  filled: true,
                ),
              ).wrapPaddingRight(18.w),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(
                      width: .79, color: Color(0xff81929E).withOpacity(.20))),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.gift_small, height: 20.h, width: 20.w),
                  Text(
                    "40",
                    style: w500_14.copyWith(
                        color: isDarkMode ? AppColor.white : AppColor.black),
                  ).wrapPaddingRight(14.w),
                  Image.asset(Assets.coin, height: 20.h, width: 20.w),
                  Text(
                    "500",
                    style: w500_14.copyWith(
                        color: isDarkMode ? AppColor.white : AppColor.black),
                  )
                ],
              ),
            )
          ],
        ).wrapPaddingHorizontal(14.w),
        15.verticalSpace,
        Container(
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.33),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TabBar(
            controller: _tabController,
            automaticIndicatorColorAdjustment: true,
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.white,
            dividerHeight: 0,
            onTap: (index) {},
            enableFeedback: true,
            labelStyle: w400_16.copyWith(fontSize: 12.spMin),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Social'),
              Tab(text: 'Sports'),
              Tab(text: 'Love'),
              Tab(text: 'Good luck'),
              Tab(text: 'Funny')
            ],
          ).wrapPaddingAll(3),
        ).wrapPaddingHorizontal(25.w),
        15.verticalSpace,
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              for (int tabIndex = 0; tabIndex < tabItems.length; tabIndex++)
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  itemCount: tabItems[tabIndex].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 142.h,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.h,
                      mainAxisSpacing: 10.h),
                  itemBuilder: (context, itemIndex) {
                    final item = tabItems[tabIndex][itemIndex];
                    return GestureDetector(
                      onTap: () => _onItemTapped(tabIndex, itemIndex),
                      child: Stickers(
                        item: item,
                        isSelected: selectedItems[tabIndex][itemIndex],
                      ),
                    );
                  },
                )
            ],
          ),
        ),
        15.verticalSpace,
        Container(
          height: 32.h,
          width: 156.w,
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.33),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TabBar(
            controller: _tabController2,
            automaticIndicatorColorAdjustment: true,
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.white,
            dividerHeight: 0,
            onTap: (index) {},
            enableFeedback: true,
            labelStyle: w400_16.copyWith(fontSize: 12.spMin),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'My Gift'),
            ],
          ).wrapPaddingAll(3),
        ).wrapPaddingHorizontal(25.w),
        15.verticalSpace,
        AppButton('Purchase', () {}, buttonColor: true)
            .wrapPaddingHorizontal(17.w)
      ],
    );
  }
}
