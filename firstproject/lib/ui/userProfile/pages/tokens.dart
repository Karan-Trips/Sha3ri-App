import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../widgets/gift_model.dart';

@RoutePage()
class TokensPage extends StatefulWidget {
  const TokensPage({super.key});

  @override
  State<TokensPage> createState() => _TokensPageState();
}

class _TokensPageState extends State<TokensPage> {
  
  final List<TokenModel> giftData = [
    TokenModel(
        id: 'id#2563225',
        isRecived: true,
        price: '50',
        date: "20 Dec, 11:43 PM"),
    TokenModel(
        id: 'id#2563225',
        isRecived: true,
        price: '50',
        date: "20 Dec, 11:43 PM"),
    TokenModel(
        id: 'id#2563225',
        isRecived: true,
        price: '50',
        date: "20 Dec, 11:43 PM"),
    TokenModel(
        id: 'id#2563225',
        isRecived: true,
        price: '50',
        date: "20 Dec, 11:43 PM"),
    TokenModel(
        id: 'id#2563225',
        isRecived: false,
        price: '50',
        date: "20 Dec, 11:43 PM"),
  ];
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tokens",
          style: w600_16.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 87.h,
            color: Color(0xffFCD227).withOpacity(.18),
            child: Row(
              children: [
                Image.asset(Assets.gift, height: 40.h, width: 40.w)
                    .wrapPaddingRight(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "100",
                      softWrap: true,
                      style: w700_22.copyWith(
                          color: isDarkMode ? AppColor.white : AppColor.black),
                    ).wrapPaddingBottom(1.h),
                    Text(
                      "Total Tokens",
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
                    // showModalBottomSheet(
                    //     context: context,
                    //     showDragHandle: true,
                    //     isDismissible: true,
                    //     isScrollControlled: true,
                    //     builder: (context) => GiftPage());
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
          27.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Token History",
                style: w700_22.copyWith(
                    fontSize: 18.sp,
                    color: isDarkMode ? AppColor.white : AppColor.black),
              ).wrapPaddingBottom(15.h),
              ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final date = giftData[index].date;
                    final price = giftData[index].price;
                    final isRecived = giftData[index].isRecived;
                    final id = giftData[index].id;
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            date,
                            style: w600_16.copyWith(
                                fontSize: 14.sp,
                                fontFamily: 'figtree_medium',
                                color: isDarkMode
                                    ? AppColor.white
                                    : AppColor.black),
                          ).wrapPaddingBottom(3.h),
                          subtitle: Text(
                            isRecived ? id : "Gift Purchased",
                            style: w500_14.copyWith(
                                color: AppColor.lightgrey, fontSize: 12.sp),
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w,
                                  color: isRecived
                                      ? Color(0xff1DB173)
                                      : Color(0xffE41717)),
                              borderRadius: BorderRadius.circular(6.r),
                              color: isRecived
                                  ? Color(0xff1DB173).withOpacity(.15)
                                  : Color(0xffE41717).withOpacity(.15),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 9.w, vertical: 4.h),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isRecived
                                    ? Text("+ $price",
                                            style: w700_22.copyWith(
                                                fontSize: 14.sp,
                                                color: Color(0xff1DB173)))
                                        .wrapPaddingRight(3.w)
                                    : Text(
                                        "- $price",
                                        style: w700_22.copyWith(
                                            fontSize: 14.sp,
                                            color: Color(0xffE41717)),
                                      ).wrapPaddingRight(3.w),
                                Image.asset(Assets.coin,
                                    height: 18.33.h, width: 18.33.w),
                              ],
                            ),
                          ),
                        ),
                        if (giftData.length - 1 != index)
                          Divider().wrapPaddingSymmetric(vertical: 5.h),
                      ],
                    );
                  },
                  itemCount: giftData.length)
            ],
          ).wrapPaddingHorizontal(16.w)
        ],
      ),
    );
  }
}
