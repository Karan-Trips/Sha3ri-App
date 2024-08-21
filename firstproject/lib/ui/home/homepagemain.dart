import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/chat/ui/chat_page.dart';
import 'package:flutter_demo_structure/ui/home/pages/notification.dart';
import 'package:flutter_demo_structure/ui/userProfile/pages/profile_setting.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import 'pages/gift_page.dart';
import 'pages/model.dart';

@RoutePage()
class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  bool _extendBodyBehindAppBar = true;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _extendBodyBehindAppBar = _tabController.index == 0;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  BoxDecoration _buildGradientDecoration(bool isDarkMode) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 255, 255, 0.657892),
          Color.fromRGBO(255, 255, 255, 0.7),
          Color.fromRGBO(255, 255, 255, 0.1)
        ],
      ),
    );
  }

  Widget _buildTopPoetsGrid(bool isDarkMode) {
    final List<Map<String, String>> poets = [
      {'image': Assets.gitar, 'name': 'Annie Ogawa'},
      {'image': Assets.lindy, 'name': 'Lindsey Workman'},
      {'image': Assets.tiana, 'name': 'Tiana Bothman'},
      {'image': Assets.gitar, 'name': 'Annie Ogawa'},
      {'image': Assets.lindy, 'name': 'Lindsey Workman'},
      {'image': Assets.tiana, 'name': 'Tiana Bothman'},
    ];
    return Container(
      decoration: _buildGradientDecoration(isDarkMode),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          var poet = poets[index];
          return Container(
            height: 211.h,
            width: 177.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(poet['image']!), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(poet['image']!),
                      radius: 16,
                    ).wrapPaddingRight(5.w),
                    Text(poet['name']!),
                  ],
                ).wrapPaddingHorizontal(10.w)
              ],
            ).wrapPaddingBottom(10.17.h),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Exit'),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            ) ??
            false;
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Observer(
            builder: (_) => Stack(children: [
                  BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor:
                          isDarkMode ? AppColor.black : AppColor.white,
                      selectedItemColor: Colors.blue,
                      elevation: 0,
                      currentIndex: _selectedIndex,
                      unselectedItemColor: Colors.black.withOpacity(.5),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                        _pageController.jumpToPage(index);
                      },
                      items: [
                        BottomNavigationBarItem(
                            activeIcon: Image.asset(
                              Assets.active_home,
                              height: 26.h,
                              width: 26.w,
                            ),
                            icon: Image.asset(
                              Assets.home,
                              height: 26.h,
                              width: 26.w,
                            ),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            activeIcon: Icon(FontAwesomeIcons.solidCommentDots),
                            icon: Icon(FontAwesomeIcons.commentDots,
                                color: isDarkMode
                                    ? AppColor.white
                                    : AppColor.black),
                            label: 'Comments'),
                        BottomNavigationBarItem(
                            icon: GestureDetector(
                              onTap: () => appRouter.push(CameraRoute()),
                              child: Container(
                                  width: 48.h,
                                  height: 48.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: Icon(FontAwesomeIcons.plus,
                                      size: 24.w, color: Colors.white)),
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            activeIcon: Image.asset(
                              Assets.active_bell,
                              height: 26.h,
                              width: 26.w,
                            ),
                            icon: Image.asset(
                              Assets.bell,
                              height: 26.h,
                              width: 26.w,
                            ),
                            label: 'Notifications'),
                        BottomNavigationBarItem(
                            activeIcon: Icon(FontAwesomeIcons.solidCircleUser),
                            icon: Icon(FontAwesomeIcons.circleUser,
                                color: isDarkMode
                                    ? AppColor.white
                                    : AppColor.black),
                            label: 'Profile')
                      ])
                ])),
        extendBodyBehindAppBar: _extendBodyBehindAppBar,
        appBar: _selectedIndex == 0
            ? AppBar(
                flexibleSpace: _tabController.index == 1
                    ? Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                            Colors.black,
                            Color.fromRGBO(255, 255, 255, 0.657892)
                          ])))
                    : null,
                elevation: 0,
                scrolledUnderElevation: 0,
                toolbarHeight: 60.h,
                backgroundColor: AppColor.transparent,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40.h),
                  child: Container(
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.33)
                          : AppColor.black.withOpacity(0.33),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      automaticIndicatorColorAdjustment: true,
                      labelPadding: EdgeInsets.zero,
                      labelColor: Colors.white,
                      dividerHeight: 0,
                      onTap: (index) {},
                      enableFeedback: true,
                      labelStyle: w400_16.copyWith(fontSize: 12.spMin),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(text: 'Feed'),
                        Tab(text: 'Top Poets'),
                        Tab(text: 'Latest'),
                        Tab(text: 'Most Liked')
                      ],
                    ).wrapPaddingAll(3),
                  ).wrapPaddingHorizontal(45.w),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          isDismissible: true,
                          backgroundColor: Color(0xff020202).withOpacity(.77),
                          isScrollControlled: true,
                          builder: (context) => GiftPage());
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      child: Lottie.asset('assets/icons/gifts.json'),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.white),
                    ).wrapPaddingRight(10.w),
                  ),
                  GestureDetector(
                    onTap: () {
                      appRouter.push(GoLiveRoute());
                    },
                    child: Container(
                            child: AppImage(
                                assets: Assets.radar,
                                height: 25.h,
                                width: 25.w),
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: AppColor.red))
                        .wrapPaddingRight(16.w),
                  ),
                ],
                leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: AssetImage(Assets.profile))),
                ).wrapPaddingLeft(16.w),
                title: GestureDetector(
                  onTap: () => appRouter.push(SearchRoute()),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: AppColor.white),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: AppColor.lightgrey)
                            .wrapPaddingRight(7.w),
                        Text(
                          "Search",
                          style: w400_16.copyWith(
                              fontSize: 14.sp, fontFamily: 'figtree_regular'),
                        )
                      ],
                    ).wrapPaddingSymmetric(horizontal: 15.w, vertical: 10.h),
                  ),
                ),
              )
            : null,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            homePage(false),
            ChatPage(),
            Center(
              child: Text(""),
            ),
            NotificationPage(),
            ProfileSettingPage()
          ],
        ),
      ),
    );
  }

  TabBarView homePage(bool isDarkMode) {
    return TabBarView(
      controller: _tabController,
      children: [
        VideoReel(
          videoUrls: [
            'assets/image/video.mp4',
            'assets/image/main.mp4',
            'assets/image/video.mp4',
          ],
        ),
        _buildTopPoetsGrid(isDarkMode),
        Center(
          child: Text(
            "Latest",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        Center(
          child: Text(
            "Most Liked",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
