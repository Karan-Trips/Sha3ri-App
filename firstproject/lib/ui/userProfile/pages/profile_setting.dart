import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../generated/assets.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          actions: [
            Badge(
              backgroundColor: AppColor.blue,
              child: Image.asset(
                Assets.frdreq,
                height: 20.h,
                width: 20.w,
                color: isDarkMode ? AppColor.white : AppColor.black,
              ),
              label: Text(
                "3",
                style: TextStyle(color: AppColor.white),
              ),
            ).wrapPaddingRight(18.w),
            Image.asset(
              Assets.setting,
              height: 20.h,
              width: 20.w,
              color: isDarkMode ? AppColor.white : AppColor.black,
            ).wrapPaddingRight(15.w)
          ],
          title: Text(
            "Account",
            style: w700_22.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            19.verticalSpace,
            _buildProfileHeader(context),
            _buildStats(context),
            _buildBio(context),
            _buildFollowAndMessageButtons(context, false)
                .wrapPaddingBottom(16.h),
            _buildPostsView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 41.r,
            backgroundImage: AssetImage(Assets.gitar),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Barbara Gills',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '@barbie',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColor.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ReadMoreText(
        'Crafting verses that paint emotions with words, weaving tales of heart and soul. Poetry is my voice, painting life\'s hues with rhythm and rhyme.',
        trimMode: TrimMode.Length,
        trimLength: 70,
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimCollapsedText: 'Readmore',
        trimExpandedText: 'Readless',
        moreStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.blue),
      ).wrapPaddingBottom(20.h),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn(context, '3.2k', 'Following'),
          _buildStatColumn(context, '2.5k', 'Followers'),
          _buildStatColumn(context, '2.5k', 'Likes'),
          _buildStatColumn(context, '100', 'Posts'),
        ],
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildFollowAndMessageButtons(BuildContext context, bool isPrivate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {},
            child: Custome_Buttons(
                image: Assets.editIcon, title: 'Edit', bgColor: true)),
        GestureDetector(
            onTap: () {},
            child: Custome_Buttons(image: Assets.coin, title: 'Token')),
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => Column(children: [],));
            },
            child: Custome_Buttons(image: Assets.gift, title: 'My Gift')),
      ],
    ).wrapPaddingHorizontal(16.w);
  }

  Widget _buildPostsView(BuildContext context) {
    final darMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.grid,
              height: 24.h,
              width: 24.w,
            ).wrapPaddingRight(5.w),
            Text('Post',
                style: w600_16.copyWith(
                    fontSize: 14.sp,
                    color: darMode ? AppColor.white : AppColor.black,
                    fontWeight: FontWeight.w500))
          ],
        ).wrapPaddingBottom(13.h),
        Divider(
          height: 2,
          color: AppColor.blue,
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 140.h,
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4),
            itemBuilder: (context, index) => Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(Assets.like2, height: 15.h, width: 15.w)
                          .wrapPaddingRight(2.w),
                      Text('12.5k',
                          style: w500_14.copyWith(
                              fontSize: 12.sp, color: AppColor.white))
                    ],
                  ).wrapPaddingOnly(bottom: 10.h, left: 11.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(Assets.gitar))),
                )).wrapPaddingBottom(10.h),
      ],
    ).wrapPaddingHorizontal(16.w);
  }
}

class Custome_Buttons extends StatelessWidget {
  const Custome_Buttons({
    super.key,
    required this.image,
    required this.title,
    this.bgColor = false,
  });

  final String image;
  final String title;
  final bool bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: bgColor ? AppColor.blue : AppColor.white,
          border:
              bgColor ? null : Border.all(width: 1, color: AppColor.lightgrey),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        children: [
          Image.asset(image, height: 16.h, width: 16.w).wrapPaddingRight(5.w),
          Text(
            title,
            style: w600_16.copyWith(
                color: bgColor ? AppColor.white : AppColor.black,
                fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
