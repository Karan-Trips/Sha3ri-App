import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/ui/auth/store/auth_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Language',
          style: w600_16.copyWith(
              color: isDarkMode ? AppColor.white : AppColor.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: AppColor.lightgrey,
              ),
              hintText: 'Search',
              hintStyle: w400_14.copyWith(color: AppColor.lightgrey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ).wrapPaddingHorizontal(16.w),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            20.verticalSpace,
            _buildLanguageOption(
              'En',
              'English',
              authStore.selectedLanguage == 'en',
              () => authStore.changeLanguage('en'),
              isDarkMode,
            ),
            Divider().wrapPaddingVertical(5.h),
            _buildLanguageOption(
              'Ar',
              'Arabic',
              authStore.selectedLanguage == 'ar',
              () => authStore.changeLanguage('ar'),
              isDarkMode,
            ),
          ],
        ).wrapPaddingHorizontal(16.w),
      ),
    );
  }

  Widget _buildLanguageOption(
    String code,
    String name,
    bool isSelected,
    VoidCallback onChanged,
    bool isDarkMode,
  ) {
    return CheckboxListTile(
      value: isSelected,
      onChanged: (val) => onChanged(),
      controlAffinity: ListTileControlAffinity.trailing,
      checkColor: AppColor.white,
      checkboxShape: const CircleBorder(),
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            child: Text(
              code,
              style: w600_16.copyWith(
                  color: isSelected ? AppColor.white : AppColor.lightgrey,
                  fontSize: 14.sp),
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.blue : Color(0xffF5F6F7),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ).wrapPaddingRight(12.w),
          Text(
            name,
            style: w600_16.copyWith(
                fontSize: 14.sp,
                color: isDarkMode ? AppColor.white : AppColor.black),
          ),
        ],
      ),
      contentPadding: EdgeInsets.zero,
      activeColor: AppColor.blue,
    );
  }
}
