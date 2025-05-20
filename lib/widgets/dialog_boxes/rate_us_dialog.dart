import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/auth/get_started_screen.dart';
import 'package:bird_discovery/views/onBoarding/choosePlan_screen.dart';
import 'package:bird_discovery/widgets/others/stars_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showRateUsDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 333.h,
        width: 314.w,
        decoration: BoxDecoration( color:AppColors.whiteColor, borderRadius: BorderRadius.circular(30.r) ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 22.h),
          child: Column(
            children: [
              Container(
                width: 70.w,
                height: 72.h,
                // decoration: BoxDecoration(
                //   color: AppColors.lightBlueColor,
                //   borderRadius: BorderRadius.circular(20.r),
                // ),
                // child: SizedBox(height: 400.h, width: 343.w),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppImages.birdDialogLogo, height: 32.h),
                    Image.asset(AppImages.birdDialogLogoFrame),
                  ],
                ),
              ),
              SizedBox(height: 23.h),
              Text(
                'Enjoying Bird Sounds\nIdentifier?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'GeneralSans',
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Tap a star to rate it on the App Store',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'GeneralSans',
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGreyColor,
                ),
              ),
              SizedBox(height: 22.h),
              SizedBox(
                height: 32.h,
                width: double.infinity,
                child: Image.asset(AppImages.stars, fit: BoxFit.contain),
              ),
              SizedBox(height: 25.h),
              InkWell(
                // onTap: () => Get.to(() => ChoosePlanScreen()),
                onTap: () => Get.to(() => GetStartedScreen()),
                child: Text(
                  'Not Now',
                  style: TextStyle(
                    fontFamily: 'GeneralSans',
                    decoration: TextDecoration.underline,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
