import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/voice_identifier_controller.dart';
import '../../../widgets/custom_button.dart';

class SnapTipsScreen extends StatelessWidget {
  const SnapTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(BirdSoundController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Snap Tips',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Space after app bar
              Center(child: BirdImageWidget()),
              //Center(child: Image.asset(AppImages.birdCircle)),
              SizedBox(height: 15.h),
              // Instructions text
              Center(
                child: Text(
                  'Tips: Snap full bird clearly',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(child: Image.asset(AppImages.snapTipsBirds1)),
              SizedBox(height: 17.h),
              Center(child: Image.asset(AppImages.snapTipsBirds2)),
              Spacer(),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 8,
                ), // Padding to give space from the screen edge
                child: CustomButton(
                  text: "Got It!",
                  isGradient: true,
                  bgColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  width: double.infinity,
                  height: 50.h,
                  onclick: () {
                    // Your action here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BirdImageWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 60.r,
          backgroundImage: AssetImage('assets/images/bird_image.jpg'),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.primaryColor,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // blue color
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: AppColors.whiteColor, size: 16.r),
          ),
        ),
      ],
    );
  }
}
