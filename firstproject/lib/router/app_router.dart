import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/ui/home/homepagemain.dart';
import 'package:flutter_demo_structure/ui/home/pages/search.dart';
import 'package:flutter_demo_structure/ui/userProfile/pages/go_live.dart';
import 'package:flutter_demo_structure/ui/welcome_page/welcome_page.dart';

import '../ui/auth/login/ui/forget_Password/reset_pass.dart';
import '../ui/auth/login/ui/forget_Password/reset_password.dart';
import '../ui/auth/sign_up/pages/profile_info.dart';
import '../ui/auth/sign_up/pages/profile_type.dart';
import '../ui/auth/sign_up/sign_up_page.dart';
import '../ui/home/pages/notification.dart';
import '../ui/nextScreen/welcome_screen.dart';
import '../ui/userProfile/createPost/create_post.dart';
import '../ui/userProfile/createPost/live_recording.dart';
import '../ui/userProfile/createPost/post_edit.dart';
import '../ui/userProfile/createPost/post_upload.dart';
import '../ui/userProfile/pages/follower.dart';
import '../ui/userProfile/user_profile.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(
      page: NextScreenRoute.page,
    ),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: ResetPasswordScreenRoute.page),
    AutoRoute(page: ProfileInfoRoute.page),
    AutoRoute(page: ProfileTypeRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: CameraRoute.page),
    AutoRoute(page: PostEditRoute.page),
    AutoRoute(page: LiveRoute.page),
    AutoRoute(page: CreatePostRoute.page),
    AutoRoute(page: GoLiveRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: FollowerRoute.page),
    CustomRoute(
        initial: true,
        page: HomeRouteMain.page,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 1000),
  ];
}

final appRouter = locator<AppRouter>();
