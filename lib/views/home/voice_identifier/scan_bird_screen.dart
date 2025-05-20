import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/voice_identifier_controller.dart';

class ScanBirdScreen extends StatelessWidget {
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

          // Bottom white sheet - Modified to be smaller
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 115.h, // Adjust this height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () => controller.capturePhoto(),
                  child: Image.asset(
                    AppImages.scanBird,
                    height: 100,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30.w, color: Colors.blue),
          SizedBox(height: 5.h),
          Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.black)),
        ],
      ),
    );
  }
}
