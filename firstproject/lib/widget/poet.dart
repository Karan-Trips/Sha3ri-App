import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/export.dart';

class PoetPage extends StatelessWidget {
  const PoetPage({
    super.key,
    required this.poet,
  });

  final Map<String, String> poet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(poet["image"]!),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          poet["name"]!,
          style: textBold,
        )
      ],
    );
  }
}
