import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/locator/locator.dart';
import '../../../router/app_router.dart';

@RoutePage()
class FollowerPage extends StatefulWidget {
  const FollowerPage({super.key, required this.types});
  final int types;

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  final List<Map<String, dynamic>> followers = [
    {
      'name': 'Justin Aminoff',
      'username': '@rose',
      'status': 'Follow',
      'image': Assets.a1,
    },
    {
      'name': 'Stephanie Magnus',
      'username': '@rose',
      'status': 'Following',
      'image': Assets.a2,
    },
    {
      'name': 'Jocelyn Dorwart',
      'username': '@rose',
      'status': 'Following',
      'image': Assets.a3,
    },
    {
      'name': 'Paityn Curtis',
      'username': '@rose',
      'status': 'Following',
      'image': Assets.a1,
    },
    {
      'name': 'Haylie Bergson',
      'username': '@rose',
      'status': 'Follow',
      'image': Assets.a2,
    },
    {
      'name': 'Marley Botosh',
      'username': '@rose',
      'status': 'Following',
      'image': Assets.a3,
    },
    {
      'name': 'Adison Aminoff',
      'username': '@rose',
      'status': 'Following',
      'image': Assets.a2,
    },
    {
      'name': 'Jakob Bergson',
      'username': '@rose',
      'status': 'Following',
      'image': Assets.a1,
    },
    {
      'name': 'Tiana Philips',
      'username': '@rose',
      'status': 'Follow',
      'image': Assets.a3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final filteredFollowers = widget.types == 0
        ? followers
        : followers.where((f) => f['status'] == 'Follow').toList();

    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        forceMaterialTransparency: true,
        centerTitle: true,
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
        title: Text(
          widget.types == 0 ? "Followers" : "Following",
          style: w600_16.copyWith(
            color: isDarkMode ? AppColor.white : AppColor.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredFollowers.length,
        itemBuilder: (context, index) {
          final follower = filteredFollowers[index];

          return ListTile(
            onTap: () {
              locator<AppRouter>().push(
                ProfileRoute(
                  isPrivate: false,
                  username: follower['name'],
                  bio:
                      'Crafting verses that paint emotions with words, weaving tales of heart and soul. Poetry is my voice, painting life\'s hues with rhythm and rhyme. Readmore',
                  following: "3.2k",
                  followers: "2.5k",
                  likes: "2.5k",
                  posts: "100",
                  totalFavorited: "32",
                  totalLive: "50",
                ),
              );
            },
            leading: CircleAvatar(
              radius: 24.r,
              backgroundImage: AssetImage(follower['image']),
            ),
            subtitle: Text(
              follower['username'],
              style: w400_14.copyWith(
                fontSize: 12.sp,
                color: AppColor.lightgrey,
                fontStyle: FontStyle.italic,
              ),
            ).wrapPaddingTop(5.h),
            title: Text(
              follower['name'],
              style: w600_16.copyWith(
                fontSize: 14.sp,
                color: isDarkMode ? AppColor.white : AppColor.black,
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(vertical: 7.5.h, horizontal: 24.w),
              decoration: BoxDecoration(
                color: follower['status'] == "Follow"
                    ? AppColor.transparent
                    : AppColor.blue,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  width: 1,
                  color: follower['status'] == "Following"
                      ? AppColor.blue
                      : AppColor.lightgrey,
                ),
              ),
              child: Text(
                follower['status'],
                style: w400_14.copyWith(
                  fontFamily: 'figtree_semibold',
                  color: follower['status'] == "Following"
                      ? AppColor.white
                      : AppColor.lightgrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
