import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/export.dart';
import 'report_sheet.dart';

class OptionSheet extends StatelessWidget {
  const OptionSheet({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        20.verticalSpace,
        ListTile(
          leading: Icon(Icons.person_add_disabled_rounded),
          title: Text(username, style: textBold),
          onTap: () => Navigator.pop(context),
        ),
        Divider().wrapPaddingLeft(45.w),
        ListTile(
          leading: Icon(Icons.report),
          title: Text(
            'Report $username',
            style: textBold,
          ),
          onTap: () {
            Navigator.pop(context);
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                showDragHandle: true,
                builder: (context) => ReportSheet(username: username)
                    .wrapPaddingHorizontal(16.w));
          },
        ),
        Divider().wrapPaddingLeft(45.w).wrapPaddingBottom(14.h),
      ],
    );
  }
}
