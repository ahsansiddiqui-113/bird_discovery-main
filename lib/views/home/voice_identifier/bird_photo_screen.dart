import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/voice_identifier/snap_tip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/voice_identifier_controller.dart';

class BirdPhotoScreen extends StatelessWidget {
  final BirdSoundController controller = Get.put(BirdSoundController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor.withOpacity(0.7),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            controller.imageFile.value = null; // Clear the image
            Get.back();
          },
        ),
        elevation: 0,
      ),
      backgroundColor: AppColors.blackColor.withOpacity(0.7),
      body: Stack(
        children: [
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer white container
                    Container(
                      width: 300.w,
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Obx(
                        () =>
                            controller.imageFile.value == null
                                ? Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 50.w,
                                    color: Colors.grey,
                                  ),
                                )
                                : ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.file(
                                    controller.imageFile.value!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                      ),
                    ),

                    // Text inside the frame but outside the inner square
                    Positioned(
                      top: 20.h,
                      child: Column(
                        children: [
                          Text(
                            'Zoom & Drag the frame',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'within the square',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Inner focus area (transparent with border)
                    Container(
                      width: 279.w,
                      height: 279.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.7),
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Bottom white sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOptionButton(
                    imagePath:
                        AppImages.albumIcon, // Replace with your image path
                    onTap: () => controller.selectPhotoFromGallery(),
                  ),
                  _buildOptionButton(
                    imagePath:
                        AppImages.checkImage, // Replace with your image path
                    onTap: () => controller.capturePhoto(),
                  ),
                  _buildOptionButton(
                    imagePath:
                        AppImages.snapTips, // Replace with your image path
                    onTap: () => Get.to(() => SnapTipsScreen()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 70.w,
            height: 70.h,
          ), // Using Image instead of Icon
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
