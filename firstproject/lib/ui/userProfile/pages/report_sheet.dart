import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../../values/export.dart';

class ReportSheet extends StatefulWidget {
  const ReportSheet({
    super.key,
    required this.username,
  });

  final String username;

  @override
  State<ReportSheet> createState() => _ReportSheetState();
}

class _ReportSheetState extends State<ReportSheet> {
  String? _selectedReportType;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            15.verticalSpace,
            Text(
              "Are you interested in making a report to",
              textAlign: TextAlign.center,
              style: w600_20.copyWith(
                  color: isDarkMode ? AppColor.white : AppColor.black),
            ).wrapPaddingSymmetric(horizontal: 31.w, vertical: 15.h),
            CircleAvatar(
              radius: 41.r,
              backgroundImage: AssetImage(Assets.gitar),
            ).wrapPaddingBottom(15.h),
            Text(
              "Stephanie Magnus",
              style: w600_20.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? AppColor.white : AppColor.black),
            ).wrapPaddingBottom(5.h),
            Text(
              "@${widget.username}",
              style: w400_16.copyWith(
                  fontSize: 14.spMax,
                  fontFamily: 'figtree_regular',
                  color: AppColor.blue),
            ).wrapPaddingBottom(15.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      width: 1, color: AppColor.lightgrey.withOpacity(.20))),
              child: Column(
                children: [
                  _buildRadioListTile('Spam'),
                  _buildRadioListTile('Inappropriate'),
                  _buildRadioListTile('Other'),
                ],
              ),
            ).wrapPaddingBottom(15.h),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'Reason',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xffE7EBF0))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xffE7EBF0)))),
            ).wrapPaddingBottom(15.h),
            AppButton('Submit', () {
              Navigator.pop(context);
            }, buttonColor: true)
          ],
        ),
      ),
    );
  }

  Widget _buildRadioListTile(String value) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return RadioListTile<String>(
      activeColor: AppColor.blue,
      value: value,
      groupValue: _selectedReportType,
      onChanged: (String? newValue) {
        setState(() {
          _selectedReportType = newValue;
        });
      },
      title: Text(
        value,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: isDarkMode ? AppColor.white : AppColor.black,
        ),
      ),
    );
  }
}
