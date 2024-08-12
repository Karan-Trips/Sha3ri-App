import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditUserProfilePage extends StatefulWidget {
  const EditUserProfilePage({super.key});

  @override
  State<EditUserProfilePage> createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController userNameController;
  late TextEditingController introController;
  @override
  void initState() {
    firstNameController = TextEditingController(text: 'Karan');
    lastNameController = TextEditingController(text: 'Trips');
    userNameController = TextEditingController(text: '@Karan-Trips');
    introController = TextEditingController(
        text:
            'Crafting verses that paint emotions with words, weaving tales of heart and soul. Poetry is my voice, painting life\'s hues with rhythm and rhyme.');
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Edit Profile",
            softWrap: true,
            style: w600_16.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          )),
      body: Column(
        children: [
          40.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            "Please update your information if any changes are needed.",
            style: w600_20.copyWith(
                fontFamily: 'figtree_semibold',
                color: isDarkMode ? AppColor.white : AppColor.black),
          ).wrapPaddingBottom(35.h).wrapPaddingHorizontal(19.w),
          editTextFormField("First Name", isDarkMode, 1, firstNameController)
              .wrapPaddingBottom(15.h),
          editTextFormField("Last Name", isDarkMode, 1, lastNameController)
              .wrapPaddingBottom(15.h),
          editTextFormField("Username", isDarkMode, 1, userNameController)
              .wrapPaddingBottom(15.h),
          editTextFormField(
                  "Write a short introduction", isDarkMode, 4, introController)
              .wrapPaddingBottom(15.h),
          Spacer(),
          AppButton('Update', () {}, buttonColor: true).wrapPaddingBottom(18.h)
        ],
      ).wrapPaddingHorizontal(17.w),
    );
  }

  Container editTextFormField(
      String name, bool isDarkMode, int maxLines, controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.w, color: AppColor.lightgrey)),
      child: TextFormField(
        maxLines: maxLines,
        onEditingComplete: () {},
        controller: controller,
        style: w700_22.copyWith(
            fontSize: 15.sp,
            color: isDarkMode ? AppColor.white : AppColor.black),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          alignLabelWithHint: true,
          labelText: name,
          labelStyle: w400_16.copyWith(
              fontSize: 12.sp,
              fontFamily: 'figtree_semibold',
              color: isDarkMode ? AppColor.white : AppColor.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
