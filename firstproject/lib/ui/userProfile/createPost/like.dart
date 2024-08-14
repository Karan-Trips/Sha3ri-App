import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/ui/userProfile/widgets/like_model.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LikePostPage extends StatefulWidget {
  const LikePostPage({super.key});

  @override
  State<LikePostPage> createState() => _LikePostPageState();
}

class _LikePostPageState extends State<LikePostPage> {
  final List<LikedModel> data = [
    LikedModel(
        name: 'Karan trips',
        image: Assets.a3,
        idName: '@karan',
        isFollow: true),
    LikedModel(
        name: 'raju', image: Assets.a2, idName: '@rose', isFollow: false),
    LikedModel(
        name: 'kaka', image: Assets.a1, idName: '@rose', isFollow: false),
    LikedModel(
        name: 'aman ', image: Assets.a2, idName: '@rose', isFollow: true),
    LikedModel(
        name: 'Arjun ', image: Assets.a3, idName: '@rose', isFollow: false),
    LikedModel(name: 'Rose', image: Assets.a1, idName: '@rose', isFollow: true),
    LikedModel(name: 'Op', image: Assets.a1, idName: '@rose', isFollow: false),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarTitleColor = isDarkMode ? AppColor.white : AppColor.black;
    final hintTextColor = isDarkMode ? AppColor.lightgrey : AppColor.lightgrey;
    final followButtonColor =
        isDarkMode ? Color(0xff0A0908) : Color(0xffF5F6F7);
    final followButtonTextColor = isDarkMode ? AppColor.white : AppColor.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Likes",
          style: w600_16.copyWith(
            fontSize: 14.sp,
            color: appBarTitleColor,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: AppColor.lightgrey),
              hintText: 'Search',
              hintStyle: w400_14.copyWith(color: hintTextColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ).wrapPaddingHorizontal(16.w),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final model = data[index];
          final image = model.image;
          final idName = model.idName;
          final name = model.name;
          final isFollow = model.isFollow;
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 24.r,
            ),
            title: Text(
              name,
              style: w600_16.copyWith(
                fontSize: 14.sp,
                color: isDarkMode ? AppColor.white : AppColor.black,
              ),
            ),
            subtitle: Text(
              idName,
              style: w400_14.copyWith(
                fontSize: 12.sp,
                color: AppColor.lightgrey,
                fontStyle: FontStyle.italic,
              ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.w,
                    color: isFollow ? AppColor.blue : AppColor.lightgrey),
                color: isFollow ? AppColor.blue : followButtonColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.5.h),
              child: Text(
                isFollow ? "Following" : "Follow",
                style: w600_16.copyWith(color: followButtonTextColor),
              ),
            ),
          );
        },
      ).wrapPaddingHorizontal(16.w),
    );
  }
}
