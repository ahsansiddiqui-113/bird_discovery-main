import 'package:bird_discovery/controllers/capture_image_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/enhanceImage/crop_image_screen.dart';
import 'package:bird_discovery/views/home/home_screen.dart';
import 'package:bird_discovery/views/home/widgets/bottom_nav_bar_screen.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CaptureImageScreen extends StatefulWidget {
  const CaptureImageScreen({super.key});

  @override
  State<CaptureImageScreen> createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  final CaptureImageController controller =
      Get.isRegistered<CaptureImageController>()
          ? Get.find<CaptureImageController>()
          : Get.put(CaptureImageController());

  @override
  void initState() {
    controller.setupCameraController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('-----------------------------------------');
    print(controller.cameraController?.value.isInitialized);
    return Scaffold(
      body: Obx(
        () => Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            controller.isCameraInitialized.value == false
                ? Center(child: CircularProgressIndicator())
                :
                // height: 400.h,
                CameraPreview(controller.cameraController!),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 32.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        // onPressed: () => Get.offAll(() => BottomNavBarScreen()),
                        onPressed: () => Get.back(),
                        child: Icon(Icons.close, color: AppColors.blackColor),
                      ),
                      CustomIconButton(
                        // onPressed: () => Get.back(),
                        // child: Icon(
                        //   Icons.flash_off,
                        //   color: AppColors.blackColor,
                        // ),
                        child: Image.asset(
                          AppImages.flashOffIcon,
                          height: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Take bird photo to get Enhancer',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  height: 189.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 31.h,
                      horizontal: 10.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Bird Photo AI Enhancer',
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                final value =
                                    await controller.pickImageFromGallery();
                                if (value) {
                                  Get.off(() => CropImageScreen());
                                }
                              },

                              child: Image.asset(
                                AppImages.picAlbumIcon,
                                height: 35.h,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final value = await controller.takePicture();
                                if (value) {
                                  Get.off(() => CropImageScreen());
                                }
                              },
                              child: Image.asset(
                                AppImages.shutterIcon,
                                height: 70.h,
                                width: 70.w,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.transparent,
                              ),
                            ),
                            // SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
