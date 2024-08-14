import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class SideButtons extends StatelessWidget {
  final Color color;
  final String image;
  final VoidCallback onPressed;

  const SideButtons({
    super.key,
    required this.color,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: AppImage(
          height: 24.h,
          width: 24.w,
          assets: image,
        ),
      ),
    );
  }
}
