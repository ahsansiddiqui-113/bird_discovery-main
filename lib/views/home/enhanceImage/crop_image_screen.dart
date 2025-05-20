import 'dart:typed_data';

import 'package:bird_discovery/controllers/capture_image_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/enhanceImage/capture_image_screen.dart';
import 'package:bird_discovery/views/home/enhanceImage/enhance_image_screen.dart';
import 'package:bird_discovery/views/home/home_screen.dart';
import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CropImageScreen extends StatefulWidget {
  const CropImageScreen({super.key});

  @override
  State<CropImageScreen> createState() => _CropImageScreenState();
}

class _CropImageScreenState extends State<CropImageScreen> {
  final CaptureImageController controller =
      Get.isRegistered<CaptureImageController>()
          ? Get.find<CaptureImageController>()
          : Get.put(CaptureImageController());

  @override
  void initState() {
    // controller.pickImageFromGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(controller.imageData);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          controller.imageData == null
              ? Center(child: Text('No image loaded'))
              : Expanded(
                // child: Visibility(
                child:
                    controller.imageData != null
                        ? Crop(
                          controller: controller.cropController,
                          image: controller.imageData!,
                          onCropped: (result) {
                            controller.cropImage(result);
                            // Handle the cropped image (e.g., save or display it)
                          },
                        )
                        : CircularProgressIndicator(),
                // ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      onPressed: () => Get.back(),
                      child: Icon(Icons.close, color: AppColors.blackColor),
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
                'Zoom & Drag the frame your\nbird within the square',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 15.sp,

                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 26.h),
              Container(
                height: 175.h,
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
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomElevatedButton(
                            onclick: () => Get.off(() => CaptureImageScreen()),
                            width: 152.w,
                            height: 60.h,
                            isGradient: false,
                            bgColor: AppColors.lightGreyColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.retakeIcon, height: 20.h),
                                // Icon(
                                //   Icons.camera_alt,
                                //   color: AppColors.blackColor,
                                // ),
                                SizedBox(width: 5.w),
                                Text('Retake'),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            onclick: () => Get.off(() => EnhanceImageScreen()),
                            width: 152.w,
                            height: 60.h,
                            isGradient: true,
                            child: Text(
                              'Next',
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
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
    );
  }
}
