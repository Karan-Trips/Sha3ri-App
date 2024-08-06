import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../generated/assets.dart';
import '../../../values/export.dart';

@RoutePage()
class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with TickerProviderStateMixin {
  String? _photoPath;
  late TabController _tabController;
  late TabController _bottomSheetController2;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _bottomSheetController2 = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _bottomSheetController2.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print('Image picked: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: TabBarView( 
                controller: _tabController,
                children: [
                  CameraAwesomeBuilder.awesome(
                    theme: AwesomeTheme(
                        bottomActionsBackgroundColor: AppColor.transparent),
                    middleContentBuilder: (state) {
                      return _photoPath != null
                          ? AspectRatio(
                              aspectRatio: 
                                  MediaQuery.of(context).size.aspectRatio,
                              child: Image.file(
                                File(_photoPath!),
                                fit: BoxFit.cover,
                              ),
                            )
                          : SizedBox.shrink();
                    },
                    sensorConfig:
                        SensorConfig.single(flashMode: FlashMode.auto),
                    previewAlignment: Alignment.bottomLeft,
                    topActionsBuilder: (state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => locator<AppRouter>().popForced(),
                            child: Container(
                              margin: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.white.withOpacity(0.15),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  locator<AppRouter>().maybePop();
                                },
                                icon: Image.asset(
                                  Assets.close,
                                  height: 12.h,
                                  width: 12.w,
                                ),
                              ),
                            ).wrapPaddingOnly(right: 16.w, top: 15.h),
                          )
                        ],
                      );
                    },
                    saveConfig: SaveConfig.photo(
                      pathBuilder: (sensors) async {
                        final Directory extDir =
                            await getApplicationDocumentsDirectory();
                        final Directory testDir =
                            Directory('${extDir.path}/camerawesome');

                        // Create directory if it doesn't exist
                        if (!await testDir.exists()) {
                          await testDir.create(recursive: true);
                        }

                        if (sensors.length == 1) {
                          final String fileName = 'karan_pic.jpg';
                          final String filePath = '${testDir.path}/$fileName';

                          print(
                              "----------===========Saving photo to: $filePath----------===========");

                          final SingleCaptureRequest captureRequest =
                              SingleCaptureRequest(filePath, sensors.first);

                          final File file = File(filePath);
                          if (await file.exists()) {
                            print("File exists: $filePath");
                          } else {
                            print("File does not exist: $filePath");
                          }

                          setState(() {
                            _photoPath = filePath;
                          });

                          return captureRequest;
                        } else {
                          final Map<Sensor, String> filePaths = {
                            for (final sensor in sensors)
                              sensor:
                                  '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : 'back_'}${DateFormat('yyyyMMdd_HHmmss').format(DateTime.now())}.jpg',
                          };
                          return MultipleCaptureRequest(filePaths);
                        }
                      },
                    ),
                    bottomActionsBuilder: (state) {
                      return AwesomeBottomActions(
                        state: state,
                        captureButton: GestureDetector(
                          onTap: () {
                            state.when(
                              onPhotoMode: (photoState) =>
                                  photoState.takePhoto(),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.w,
                                color: AppColor.white,
                              ),
                            ),
                            child: Container(
                              height: 55.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        left: Column(
                          children: [
                            Container(
                              width: 40.r,
                              height: 40.r,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColor.white,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.photo_library,
                                    color: Colors.white),
                                onPressed: _pickImageFromGallery,
                              ),
                            ).wrapPaddingBottom(1.5.h),
                            Text(
                              "Album",
                              style: w400_16.copyWith(
                                fontFamily: 'figtree_semibold',
                                fontSize: 12.sp,
                                color: AppColor.white,
                              ),
                            ),
                          ],
                        ),
                        right: GestureDetector(
                          onTap: () {
                            if (_photoPath != null) {
                              locator<AppRouter>()
                                  .push(PostEditRoute(photoPath: _photoPath!));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 26.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColor.white.withOpacity(.25),
                            ),
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              size: 24.w,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  CameraAwesomeBuilder.awesome(
                    theme: AwesomeTheme(
                        bottomActionsBackgroundColor: AppColor.transparent),
                    bottomActionsBuilder: (state) {
                      return AwesomeBottomActions(
                        state: state,
                        captureButton: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return startRecordingBottomSheet()
                                    .wrapPaddingHorizontal(17.w);
                              },
                            ).then((value) {
                              state.when(
                                onVideoMode: (onVideo) {
                                  final captureState = onVideo.captureState;
                                  if (captureState != null) {
                                    if (captureState.isRecordingVideo) {
                                      onVideo.when(
                                        onVideoRecordingMode: (p0) {
                                          return p0.stopRecording();
                                        },
                                      );
                                    } else {
                                      onVideo.startRecording();
                                    }
                                  } else {
                                    print('Capture state is null');
                                  }
                                },
                              );
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.w,
                                color: AppColor.white,
                              ),
                            ),
                            child: Container(
                              height: 55.h,
                              width: 55.w,
                              padding: EdgeInsets.all(9.r),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  Assets.radar,
                                  color: AppColor.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    middleContentBuilder: (state) {
                      return SizedBox.shrink();
                    },
                    saveConfig: SaveConfig.video(
                      mirrorFrontCamera: false,
                      videoOptions: VideoOptions(
                        enableAudio: true,
                        quality: VideoRecordingQuality.uhd,
                        ios: CupertinoVideoOptions(
                          fps: 60,
                        ),
                        android: AndroidVideoOptions(
                          bitrate: 6000000,
                          fallbackStrategy: QualityFallbackStrategy.lower,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // TabBar overlay
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColor.white.withOpacity(.25),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: TabBar(
                  controller: _tabController,
                  automaticIndicatorColorAdjustment: true,
                  labelPadding: EdgeInsets.zero,
                  labelColor: AppColor.black,
                  dividerHeight: 0,
                  unselectedLabelStyle: w400_16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.spMin,
                      fontFamily: 'figtree_semibold'),
                  onTap: (index) {},
                  enableFeedback: true,
                  labelStyle: w400_16.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.spMin,
                      fontFamily: 'figtree_semibold'),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(text: 'Post'),
                    Tab(text: 'Live'),
                  ],
                ).wrapPaddingAll(3),
              ).wrapPaddingHorizontal(95.w),
            ),
          ],
        ),
      ),
    );
  }

  Column startRecordingBottomSheet() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          20.verticalSpace,
          Center(
            child: Text("Live Stream",
                style: w600_20.copyWith(
                    color: isDarkMode ? AppColor.white : AppColor.black)),
          ).wrapPaddingBottom(25.h),
          Text('Type of Stream Type',
                  style: w600_16.copyWith(
                      color: isDarkMode ? AppColor.white : AppColor.black,
                      fontSize: 14.sp))
              .wrapPaddingBottom(10.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            height: 50.h,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: TabBar(
              controller: _bottomSheetController2,
              automaticIndicatorColorAdjustment: true,
              labelPadding: EdgeInsets.zero,
              labelColor: AppColor.white,
              dividerHeight: 0,
              unselectedLabelStyle: w400_16.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.spMin,
                  fontFamily: 'figtree_semibold'),
              onTap: (index) {},
              enableFeedback: true,
              labelStyle: w400_16.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.spMin,
                  fontFamily: 'figtree_semibold'),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(10.r),
              ),
              unselectedLabelColor: AppColor.lightgrey,
              tabs: [
                Tab(text: 'Video'),
                Tab(text: 'Audio'),
              ],
            ).wrapPaddingAll(3),
          ),
          TextFormField(
                  autocorrect: true,
                  maxLines: 4,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.w, top: 15.h),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color:
                              isDarkMode ? Colors.white54 : Color(0xffE7EBF0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color:
                              isDarkMode ? Colors.white54 : Color(0xffE7EBF0),
                        ),
                      ),
                      hintText: 'Write a Live Description',
                      hintStyle: w600_16.copyWith(
                          color: isDarkMode
                              ? Colors.white70
                              : AppColor.lightgrey)))
              .wrapPaddingVertical(10.h),
          AppButton('Start', () {
            // locator<AppRouter>().popForced();
            locator<AppRouter>().push(LiveRoute());
          }, buttonColor: true),
          AppButton('Cancel', () {}, buttonColor: false),
        ]);
  }
}
