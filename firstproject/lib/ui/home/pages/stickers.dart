import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../../values/export.dart';
import '../../../widget/app_image.dart';

class Stickers extends StatelessWidget {
  const Stickers({
    super.key,
    required this.item,
    required this.isSelected,
  });

  final Map<String, dynamic> item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border:
              Border.all(width: 1.w, color: AppColor.white.withOpacity(.20))),
      child: Stack(
        children: [
          Positioned(
            right: -5.w,
            top: -5.h,
            child: Checkbox(
              activeColor: AppColor.blue,
              checkColor: AppColor.white,
              value: isSelected,
              onChanged: (val) {},
              shape: CircleBorder(),
            ),
          ),
          Column(
            children: [
              AppImage(
                assets: item['asset'],
                height: 70.h,
                width: 80.w,
              ).wrapPaddingBottom(5.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 7.w),
                decoration: BoxDecoration(
                  color: Color(0xffE41717),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 3.w, color: AppColor.white),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppImage(
                      assets: Assets.coin,
                      height: 14.h,
                      width: 14.w,
                    ).wrapPaddingRight(4.w),
                    Text(
                      "${item['coins']}",
                      style: w500_14.copyWith(color: AppColor.white),
                    ),
                  ],
                ),
              )
            ],
          ).wrapPaddingAll(5.r),
        ],
      ),
    );
  }
}
