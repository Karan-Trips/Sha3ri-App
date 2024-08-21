import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/media_picker_bottomsheet.dart';

@RoutePage()
class CompelteProfilePage extends StatefulWidget {
  const CompelteProfilePage({super.key});

  @override
  State<CompelteProfilePage> createState() => _CompelteProfilePageState();
}

class _CompelteProfilePageState extends State<CompelteProfilePage> {
  XFile? _selectedFile;

  void _onSelectFile(XFile? file, PickedFileType type) {
    setState(() {
      _selectedFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xffF5F6F7);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final containerColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final buttonColor = isDarkMode ? Colors.blue[300] : AppColor.blue;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          actions: [
            Text(
              "Skip",
              style: w400_16.copyWith(color: textColor),
            ).wrapPaddingRight(17.w).wrapPaddingTop(15.h)
          ],
          title: Text("Complete Profile",
              style: w600_16.copyWith(color: textColor))),
      body: Column(
        children: [
          40.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            "We love a great looking profile, Let’s make one!",
            style: w600_20.copyWith(color: textColor),
          ).wrapPaddingHorizontal(36.w).wrapPaddingBottom(30.h),
          Container(
              child: Column(children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(15.r),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: CircleAvatar(
                    radius: 136.r,
                    backgroundImage: _selectedFile != null
                        ? FileImage(File(_selectedFile!.path))
                        : AssetImage(Assets.cam_girl) as ImageProvider,
                  ),
                ).wrapPaddingBottom(30),
                Positioned(
                  bottom: 40.h,
                  right: 30.w,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => MediaPickerSheet(
                          pickFileType: PickedFileType.image,
                          onSelectFile: _onSelectFile,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: buttonColor,
                        ),
                        child: Image.asset(
                          Assets.cam,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Upload your Profile',
              style: w500_14.copyWith(color: textColor),
            ).wrapPaddingBottom(10.h),
          ])),
          Spacer(),
          AppButton(
            'Next',
            () => appRouter.push(ProfileInfoRoute()),
            buttonColor: true,
          ).wrapPaddingHorizontal(16.w).wrapPaddingBottom(20.h)
        ],
      ),
    );
  }
}
