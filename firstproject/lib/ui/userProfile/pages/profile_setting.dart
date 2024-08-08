import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
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
            GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: AppColor.blue,
                child: Image.asset(
                  Assets.frdreq,
                  height: 24.h,
                  width: 24.w,
                  color: isDarkMode ? AppColor.white : AppColor.black,
                ),
                label: Text("3", style: TextStyle(color: AppColor.white)),
              ).wrapPaddingRight(18.w),
            ),
            GestureDetector(
              onTap: () => locator<AppRouter>().push(SettingRoute()),
              child: Image.asset(Assets.setting,
                      height: 24.h,
                      width: 24.w,
                      color: isDarkMode ? AppColor.white : AppColor.black)
                  .wrapPaddingRight(15.w),
            )
          ],
          title: Text("Account",
              style: w700_22.copyWith(
                  color: isDarkMode ? AppColor.white : AppColor.black))),
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
          GestureDetector(
              onTap: () {
                locator<AppRouter>().push(FollowerRoute(types: 0));
              },
              child: _buildStatColumn(context, '3.2k', 'Following')),
          GestureDetector(
              onTap: () {
                locator<AppRouter>().push(FollowerRoute(types: 1));
              },
              child: _buildStatColumn(context, '2.5k', 'Followers')),
          GestureDetector(
              onTap: () {}, child: _buildStatColumn(context, '2.5k', 'Likes')),
          GestureDetector(
              onTap: () {}, child: _buildStatColumn(context, '100', 'Posts')),
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
                  context: context,
                  builder: (context) => Column(
                        children: [],
                      ));
            },
            child: Custome_Buttons(image: Assets.gift, title: 'My Gift')),
      ],
    ).wrapPaddingHorizontal(16.w);
  }

  Widget _buildPostsView(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColor.blue,
            automaticIndicatorColorAdjustment: true,
            enableFeedback: true,
            indicatorWeight: 2,
            dividerHeight: 0,
            labelPadding: EdgeInsets.only(bottom: 11.h),
            padding: EdgeInsets.only(bottom: 15.h),
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.grid, height: 24.h, width: 24.w)
                      .wrapPaddingRight(5.w),
                  Text("Post")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.heart,
                    height: 24.h,
                    width: 24.w,
                    color: isDarkMode ? AppColor.white : AppColor.black,
                  ).wrapPaddingRight(5.w),
                  Text("Favorite")
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                // Post Tab View
                _buildPost(),
                // Favorite Tab View
                _buildFavorite(),
              ],
            ),
          ),
        ],
      ).wrapPaddingHorizontal(16.w),
    );
  }

  GridView _buildPost() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 130.h,
            crossAxisCount: 3,
            mainAxisSpacing: 4.w,
            crossAxisSpacing: 4.w),
        itemBuilder: (context, index) => Container(
              width: 118.w,
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
            ));
  }

  GridView _buildFavorite() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 140.h,
            crossAxisCount: 3,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4),
        itemBuilder: (context, index) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Assets.heart_liked, height: 15.h, width: 15.w)
                          .wrapPaddingRight(15.w),
                    ],
                  ).wrapPaddingOnly(top: 10.h, left: 11.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(Assets.like2, height: 15.h, width: 15.w)
                          .wrapPaddingRight(2.w),
                      Text('12.5k',
                          style: w500_14.copyWith(
                              fontSize: 12.sp, color: AppColor.white))
                    ],
                  ).wrapPaddingOnly(bottom: 10.h, left: 11.w),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(Assets.gitar))),
            ));
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
