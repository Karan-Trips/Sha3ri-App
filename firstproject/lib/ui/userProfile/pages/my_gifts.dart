import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/ui/userProfile/widgets/gift_model.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/pages/gift_page.dart';

@RoutePage()
class MyGiftPage extends StatefulWidget {
  const MyGiftPage({super.key});

  @override
  State<MyGiftPage> createState() => _MyGiftPageState();
}

class _MyGiftPageState extends State<MyGiftPage>
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

  final List<GiftModel> giftData = [
    GiftModel(
        id: '0',
        title: 'Nice Work',
        image: Assets.nice_work,
        price: '50',
        status: 'Social',
        date: "20 Dec, 11:43 PM"),
    GiftModel(
        id: '1',
        title: 'Great Job',
        image: Assets.great_job,
        price: '50',
        status: 'Social',
        date: "20 Dec, 11:43 PM"),
    GiftModel(
        id: '2',
        title: 'Great Job',
        image: Assets.great_job,
        price: '50',
        status: 'Social',
        date: "20 Dec, 11:43 PM"),
    GiftModel(
        id: '3',
        title: 'Great Job',
        image: Assets.great_job,
        price: '50',
        status: 'Social',
        date: "20 Dec, 11:43 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Gifts",
          style: w600_16.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 87.h,
            color: Color(0xff0074FF).withOpacity(.18),
            child: Row(
              children: [
                Image.asset(Assets.gift, height: 40.h, width: 40.w)
                    .wrapPaddingRight(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "40",
                      softWrap: true,
                      style: w700_22.copyWith(
                          color: isDarkMode ? AppColor.white : AppColor.black),
                    ).wrapPaddingBottom(1.h),
                    Text(
                      "Total Gifts",
                      style: w400_14.copyWith(
                          color: isDarkMode ? AppColor.white : AppColor.black,
                          fontFamily: 'figtree_medium',
                          fontSize: 12.sp),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector( 
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isDismissible: true,
                        isScrollControlled: true,
                        builder: (context) => GiftPage());
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.blue),
                    child: Text("Purchase",
                        style: w600_16.copyWith(
                            fontSize: 14.sp,
                            fontFamily: 'figtree_semibold',
                            color: AppColor.white)),
                  ).wrapPaddingRight(2.w),
                ),
              ],
            ).wrapPaddingHorizontal(16.w),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Gift History",
                      style: w700_22.copyWith(
                        fontSize: 18.sp,
                        color: isDarkMode ? AppColor.white : AppColor.black,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                      height: 32.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.w,
                            color: AppColor.lightgrey.withOpacity(.20)),
                        color: AppColor.white.withOpacity(.25),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        automaticIndicatorColorAdjustment: true,
                        labelPadding: EdgeInsets.zero,
                        labelColor: AppColor.white,
                        dividerColor: AppColor.transparent,
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
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        unselectedLabelColor: AppColor.lightgrey,
                        tabs: const [
                          Tab(text: 'Purchased'),
                          Tab(text: 'Sent'),
                        ],
                      ).wrapPaddingAll(3),
                    ),
                  ],
                ),
              ],
            ),
          ).wrapPaddingBottom(10.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                purchased(isDarkMode),
                sendGift(isDarkMode)
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView sendGift(bool isDarkMode) {
    return ListView.builder(
                  itemCount: giftData.length,
                  itemBuilder: (context, index) {
                    final image = giftData[index].image;
                    final date = giftData[index].date;
                    final title = giftData[index].title;
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            image,
                            height: 62.57.h,
                          ),
                          title: Text(
                            title,
                            style: w600_16.copyWith(
                                fontSize: 14.sp,
                                color: isDarkMode
                                    ? AppColor.white
                                    : AppColor.black),
                          ),
                          subtitle: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Sent to ',
                                style: w500_14.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.lightgrey)),
                            TextSpan(
                                text: 'Allen joie',
                                style: w500_14.copyWith(
                                    fontSize: 12.sp, color: AppColor.black))
                          ])),
                          trailing: Text(
                            date,
                            style: w500_14.copyWith(
                              fontSize: 12.sp,
                              color: AppColor.lightgrey,
                            ),
                          ),
                        ),
                        Divider().wrapPaddingSymmetric(
                            horizontal: 16.w, vertical: 10.h)
                      ],
                    );
                  });
  }

  ListView purchased(bool isDarkMode) {
    return ListView.builder(
      itemCount: giftData.length,
      itemBuilder: (context, index) {
        final price = giftData[index].price;
        final image = giftData[index].image;
        final title = giftData[index].title;
        final status = giftData[index].status;
        final date = giftData[index].date;
        return Column(
          children: [
            ListTile(
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Color(0xff0074FF)),
                  borderRadius: BorderRadius.circular(6.r),
                  color: Color(0xff0074FF).withOpacity(.15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: w700_22.copyWith(
                          fontSize: 14.sp, color: Color(0xff1DB173)),
                    ).wrapPaddingRight(3.w),
                    Image.asset(Assets.coin, height: 18.33.h, width: 18.33.w),
                  ],
                ),
              ),
              leading: Image.asset(
                image,
                height: 62.h,
                width: 72.w,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: w500_14.copyWith(
                      fontSize: 12.sp,
                      color: AppColor.blue,
                    ),
                  ).wrapPaddingVertical(3.h),
                  Text(
                    "Purchased on ${date}",
                    style: w500_14.copyWith(
                        fontSize: 12.sp, color: AppColor.lightgrey),
                  )
                ],
              ),
              title: Text(title,
                  style: w600_16.copyWith(
                      color: isDarkMode ? AppColor.white : AppColor.black,
                      fontSize: 14.sp)),
            ),
            Divider(
              height: 2.h,
              color: AppColor.lightgrey.withOpacity(.20),
            ).wrapPaddingHorizontal(20.w).wrapPaddingVertical(10.h)
          ],
        );
      },
    );
  }
}
