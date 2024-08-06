import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../values/export.dart';
import 'pages/option_sheet.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  final bool isPrivate;
  final String username;
  final String bio;
  final String following;
  final String followers;
  final String likes;
  final String posts;
  final String totalFavorited;
  final String totalLive;

  ProfilePage({
    required this.isPrivate,
    required this.username,
    required this.bio,
    required this.following,
    required this.followers,
    required this.likes,
    required this.posts,
    required this.totalFavorited,
    required this.totalLive,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColor.black : AppColor.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: isDarkMode ? AppColor.black : AppColor.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                  icon: Icon(Icons.more_vert, size: 28.w),
                  onPressed: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      builder: (context) => OptionSheet(username: username)
                          .wrapPaddingHorizontal(16.w),
                      context: context,
                    );
                  },
                ),
              ).wrapPaddingRight(16.w),
            ],
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildProfileHeader(context),
                _buildStats(context),
                _buildBio(context),
                _buildAdditionalStats(context),
                SizedBox(height: 16.h),
                _buildFollowAndMessageButtons(context, isPrivate)
                    .wrapPaddingBottom(16.h),
                if (!isPrivate)
                  Divider().wrapPaddingBottom(10.h).wrapPaddingHorizontal(16.w),
                isPrivate
                    ? _buildPrivateAccountView(context)
                    : _buildPostsView(context),
              ],
            ),
          ),
        ],
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
                'Stephanie Magnus',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '@$username',
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
          _buildStatColumn(context, following, 'Following'),
          _buildStatColumn(context, followers, 'Followers'),
          _buildStatColumn(context, likes, 'Likes'),
          _buildStatColumn(context, posts, 'Posts'),
        ],
      ),
    );
  }

  Widget _buildAdditionalStats(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            "3.2K",
            style: w600_16.copyWith(
                fontSize: 14.sp,
                color: isDarkMode ? AppColor.white : AppColor.black),
          ).wrapPaddingRight(5.w),
          Text('Total Favorited',
                  style: w600_16.copyWith(
                      fontSize: 14.sp, color: AppColor.osloGray))
              .wrapPaddingRight(20.w),
          Container(
            width: 1.w,
            color: AppColor.grey,
            height: 10.h,
          ).wrapPaddingRight(20.w),
          Text(
            "50",
            style: w600_16.copyWith(
                fontSize: 14.sp,
                color: isDarkMode ? AppColor.white : AppColor.black),
          ).wrapPaddingRight(5.w),
          Text('Total Live',
              style:
                  w600_16.copyWith(fontSize: 14.sp, color: AppColor.osloGray)),
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
    final darkmode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                backgroundColor: AppColor.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r))),
            icon: Icon(Icons.person_add, color: Colors.white),
            onPressed: () {},
            label: Text(
              'Follow',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).wrapPaddingRight(15.w),
        ),
        if (!isPrivate)
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                backgroundColor: darkmode ? AppColor.black : AppColor.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColor.lightgrey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              icon: Icon(Icons.message,
                  color: darkmode ? AppColor.white : AppColor.black),
              onPressed: () {},
              label: Text(
                'Message',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: darkmode ? AppColor.white : AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
      ],
    ).wrapPaddingHorizontal(16.w);
  }

  Widget _buildPrivateAccountView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider().wrapPaddingBottom(80.h),
          Image.asset(
            Assets.profile_circle,
            height: 37.h,
            width: 37.w,
          ).wrapPaddingBottom(10.h),
          Text(
            'This account is private',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
          SizedBox(height: 8),
          Text(
            'Follow this account to view all posts',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ).wrapPaddingHorizontal(16.w),
    );
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
                      Image.asset(
                        Assets.like2,
                        height: 15.h,
                        width: 15.w,
                      ).wrapPaddingRight(2.w),
                      Text(
                        '12.5k',
                        style: w500_14.copyWith(
                            fontSize: 12.sp, color: AppColor.white),
                      )
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
