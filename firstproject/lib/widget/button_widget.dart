import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final double? elevation;
  final double? height;
  final double? width;
  final double? radius;
  final double? padding;
  final bool buttonColor;

  const AppButton(
    this.label,
    this.callback, {
    super.key,
    double this.elevation = 0.0,
    this.height,
    this.width,
    this.radius,
    this.padding,
    this.buttonColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 55.h,
      child: MaterialButton(
        elevation: elevation,
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        onPressed: callback,
        color: buttonColor ? AppColor.blue : AppColor.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        ),
        child: Text(
          label,
          style: textMedium.copyWith(
            color: buttonColor ? AppColor.white : AppColor.lightgrey,
            fontWeight: FontWeight.w600,
            fontSize: 14.spMin,
          ),
        ),
      ),
    );
  }
}
