import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
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
  const VideoReel({super.key, required this.videoUrls});
  final videoUrls;

  @override
  _VideoReelState createState() => _VideoReelState();
}

class _VideoReelState extends State<VideoReel> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        final mediaUrl = widget.videoUrls[index];
        return ChewiePlayer(
          videoUrl: mediaUrl,
          index: index,
        );
      },
      itemCount: widget.videoUrls.length,
      containerHeight: MediaQuery.of(context).size.height,
      itemHeight: MediaQuery.of(context).size.height,
      scrollDirection: Axis.vertical,
      loop: false,
    );
  }
}

class ChewiePlayer extends StatefulWidget {
  final String videoUrl;
  final int index;

  const ChewiePlayer({required this.videoUrl, required this.index});

  @override
  _ChewiePlayerState createState() => _ChewiePlayerState();
}

class _ChewiePlayerState extends State<ChewiePlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool isLiked = true;
  bool isloved = false;
  bool isVideo = false;

  void initState() {
    super.initState();
    isVideo = widget.videoUrl.endsWith('.mp4');

    if (isVideo) {
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
                showControls: false,
                looping: true,
                autoPlay: true,
                aspectRatio: _videoPlayerController.value.aspectRatio,
              );
            });
          }
        }).catchError((error) {
          print('Video Initialization Error: $error');
        });
    }
  }

  @override
  void dispose() {
    if (isVideo) {
      _videoPlayerController.dispose();
      _chewieController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: isVideo
                ? (_chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(controller: _chewieController!)
                    : Center(child: CircularProgressIndicator()))
                : Image.asset(widget.videoUrl, fit: BoxFit.cover)),
        MediaOverlay(index: widget.index),
        Positioned(
          bottom: 30.h,
          left: 20.w,
          right: 103.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(Assets.a1))
                      .wrapPaddingRight(9.w),
                  GestureDetector(
                    onTap: () {
                      appRouter.push(
                        ProfileRoute(
                          isPrivate: true,
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

class MediaOverlay extends StatefulWidget {
  final int index;
  const MediaOverlay({super.key, required this.index});

  @override
  _MediaOverlayState createState() => _MediaOverlayState();
}

class _MediaOverlayState extends State<MediaOverlay> {
  bool isLiked = true;
  bool isloved = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            child: SideButtons(
              onPressed: () {},
              color: isLiked ? AppColor.blue : AppColor.white,
              image: isLiked ? Assets.like : Assets.like_black,
            ).wrapPaddingBottom(5.h),
          ),
          GestureDetector(
            onTap: () {
              print('Navigating to LikePostRoute with index: ${widget.index}');
              appRouter.push(LikePostRoute());
            },
            child: Text("12.5k",
                    style: w500_14.copyWith(
                        color: AppColor.white, fontSize: 12.sp))
                .wrapPaddingBottom(10.h),
          ),
          SideButtons(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                // isScrollControlled: true,
                isDismissible: true,
                showDragHandle: true,
                builder: (_) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: CommentSheet(),
                  );
                },
              );
            },
            color: Color(0xff3BE9BC),
            image: Assets.comment,
          ).wrapPaddingBottom(5.h),
          Text("12.5k",
                  style:
                      w500_14.copyWith(color: AppColor.white, fontSize: 12.sp))
              .wrapPaddingBottom(10.h),
          SideButtons(
            onPressed: () {
              setState(() {
                isloved = !isloved;
              });
            },
            color: isloved ? AppColor.red : AppColor.white,
            image: Assets.heart,
          ).wrapPaddingBottom(5.h),
          Text("12.5k",
                  style:
                      w500_14.copyWith(color: AppColor.white, fontSize: 12.sp))
              .wrapPaddingBottom(10.h),
          GestureDetector(
            onTap: () {},
            child: SideButtons(
              onPressed: () {},
              color: AppColor.white,
              image: Assets.share,
            ).wrapPaddingBottom(10.h),
          ),
          GestureDetector(
            onTap: () {},
            child: SideButtons(
              onPressed: () {},
              color: Color(0xffEDEDED).withOpacity(.47),
              image: Assets.more,
            ).wrapPaddingBottom(10.h),
          ),
        ],
      ),
    );
  }
}
