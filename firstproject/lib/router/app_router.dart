import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/ui/auth/login/widget/edit_user_profile.dart';
import 'package:flutter_demo_structure/ui/home/homepagemain.dart';
import 'package:flutter_demo_structure/ui/home/pages/search.dart';
import 'package:flutter_demo_structure/ui/home/pages/subscription_mode.dart';
import 'package:flutter_demo_structure/ui/userProfile/createPost/like.dart';
import 'package:flutter_demo_structure/ui/userProfile/createPost/post_view.dart';
import 'package:flutter_demo_structure/ui/userProfile/pages/block_user.dart';
import 'package:flutter_demo_structure/ui/userProfile/pages/go_live.dart';
import 'package:flutter_demo_structure/ui/userProfile/pages/my_gifts.dart';
import 'package:flutter_demo_structure/ui/userProfile/pages/request_list.dart';
import 'package:flutter_demo_structure/ui/welcome_page/welcome_page.dart';

import '../ui/auth/login/ui/change_lanuage.dart';
import '../ui/auth/login/ui/forget_Password/change_password.dart';
import '../ui/auth/login/ui/forget_Password/reset_pass.dart';
import '../ui/auth/login/ui/forget_Password/reset_password.dart';
import '../ui/auth/sign_up/pages/profile_info.dart';
import '../ui/auth/sign_up/pages/profile_type.dart';
import '../ui/auth/sign_up/sign_up_page.dart';
import '../ui/chat/ui/chat_details.dart';
import '../ui/home/pages/notification.dart';
import '../ui/nextScreen/welcome_screen.dart';
import '../ui/userProfile/createPost/create_post.dart';
import '../ui/userProfile/createPost/live_recording.dart';
import '../ui/userProfile/createPost/post_edit.dart';
import '../ui/userProfile/createPost/post_upload.dart';
import '../ui/userProfile/pages/follower.dart';
import '../ui/userProfile/pages/setting.dart';
import '../ui/userProfile/pages/tokens.dart';
import '../ui/userProfile/user_profile.dart';
import '../widget/about_us.dart';
import '../widget/contact_us.dart';
import '../widget/faq.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: NextScreenRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: ResetPasswordScreenRoute.page),
    AutoRoute(page: ProfileInfoRoute.page),
    AutoRoute(page: ProfileTypeRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: ChangeLanguageRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: CameraRoute.page),
    AutoRoute(page: PostEditRoute.page),
    AutoRoute(page: LiveRoute.page),
    AutoRoute(page: CreatePostRoute.page),
    AutoRoute(page: GoLiveRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: FollowerRoute.page),
    AutoRoute(page: SettingRoute.page),
    AutoRoute(page: BlockUserRoute.page),
    AutoRoute(page: MyGiftRoute.page),
    AutoRoute(page: TokensRoute.page),
    AutoRoute(page: AboutUsRoute.page),
    AutoRoute(page: ContactUsRoute.page),
    AutoRoute(page: FAQRoute.page),
    AutoRoute(page: RequestListRoute.page),
    AutoRoute(page: EditUserProfileRoute.page),
    AutoRoute(page: SubscriptionRoute.page),
    AutoRoute(page: PostRoute.page),
    AutoRoute(page: LikePostRoute.page),
    AutoRoute(page: ChatDetailsRoute.page),
    CustomRoute(
        page: HomeRouteMain.page,
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 1000),
  ];
}

final appRouter = locator<AppRouter>();
