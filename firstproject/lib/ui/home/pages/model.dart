import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/widget/model_sheet.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:video_player/video_player.dart';

import '../../../values/export.dart';
import '../../../widget/side_buttons.dart';

class VideoReel extends StatefulWidget {
  @override
  _VideoReelState createState() => _VideoReelState();
}

class _VideoReelState extends State<VideoReel> {
  final List<String> videoUrls = [
    'assets/image/video.mp4',
    'assets/image/main.mp4',
    'assets/image/video.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ChewiePlayer(videoUrl: videoUrls[index]);
      },
      itemCount: videoUrls.length,
      containerHeight: MediaQuery.of(context).size.height,
      itemHeight: MediaQuery.of(context).size.height,
      scrollDirection: Axis.vertical,
    );
  }
}

class ChewiePlayer extends StatefulWidget {
  final String videoUrl;

  const ChewiePlayer({required this.videoUrl});

  @override
  _ChewiePlayerState createState() => _ChewiePlayerState();
}

class _ChewiePlayerState extends State<ChewiePlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isLiked = true;
  bool isloved = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..addListener(() {
        if (_videoPlayerController.value.hasError) {
          print(
              'Video Player Error: ${_videoPlayerController.value.errorDescription}');
        }
      })
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              looping: true,
              autoPlay: true,
              aspectRatio: _videoPlayerController.value.aspectRatio,
              showControls: false,
              allowFullScreen: true,
            );
          });
        }
      }).catchError((error) {
        print('Video Initialization Error: $error');
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _chewieController != null &&
                  _chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: _chewieController!)
              : Center(child: CircularProgressIndicator()),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: SideButtons(
                          color: isLiked ? AppColor.blue : AppColor.white,
                          image: isLiked ? Assets.like : Assets.like_black)
                      .wrapPaddingBottom(5.h),
                ),
              ),
              Text("12.5k",
                      style: w500_14.copyWith(
                          color: AppColor.white, fontSize: 12.sp))
                  .wrapPaddingBottom(10.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    builder: (_) => CommentSheet(),
                  );
                },
                child:
                    SideButtons(color: Color(0xff3BE9BC), image: Assets.comment)
                        .wrapPaddingBottom(5.h),
              ),
              Text("12.5k",
                      style: w500_14.copyWith(
                          color: AppColor.white, fontSize: 12.sp))
                  .wrapPaddingBottom(10.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isloved = !isloved;
                  });
                },
                child: SideButtons(
                        color: isloved ? AppColor.red : AppColor.white,
                        image: Assets.heart)
                    .wrapPaddingBottom(5.h),
              ),
              Text("12.5k",
                      style: w500_14.copyWith(
                          color: AppColor.white, fontSize: 12.sp))
                  .wrapPaddingBottom(10.h),
              GestureDetector(
                onTap: () {},
                child: SideButtons(color: AppColor.white, image: Assets.share)
                    .wrapPaddingBottom(10.h),
              ),
              GestureDetector(
                onTap: () {},
                child: SideButtons(
                        color: Color(0xffEDEDED).withOpacity(.47),
                        image: Assets.more)
                    .wrapPaddingBottom(10.h),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 20.w,
          right: 103.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(Assets.cam_girl))
                      .wrapPaddingRight(9.w),
                  GestureDetector(
                    onTap: () {
                      locator<AppRouter>().push(
                        ProfileRoute(
                          isPrivate: false,
                          username: 'stephanie',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jasica Roy",
                                style: w500_14.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white))
                            .wrapPaddingBottom(2.h),
                        Text("@jess",
                            style: w400_16.copyWith(
                                color: AppColor.white,
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic))
                      ],
                    ).wrapPaddingRight(9.w),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 3.5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColor.white),
                      ),
                      child: Text("Follow",
                          style: w600_16.copyWith(color: AppColor.white)),
                    ),
                  )
                ],
              ).wrapPaddingBottom(15.h),
              Text(
                "Morbius Box Office: Jared Leto’s Film Is Towards Marvel’s 4th Lowest Opening ...#live",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: w400_16.copyWith(
                    fontFamily: 'figtree_light',
                    fontSize: 14.sp,
                    color: AppColor.white),
                softWrap: true,
              )
            ],
          ),
        ),
      ],
    );
  }
}
