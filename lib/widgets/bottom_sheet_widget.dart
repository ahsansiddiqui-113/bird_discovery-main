import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/onBoarding/about_screen.dart';
// import 'package:bird_discovery/views/onBoarding/about_screen.dart';
import 'package:bird_discovery/widgets/custom_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import '../views/onBoarding/choosePlan_screen.dart';

class PremiumBottomSheet extends StatelessWidget {
  const PremiumBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // Standard iPhone 13 size
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 20.h,
      ), // Added 10.w horizontal gap
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.appLogoLinear, height: 30.h),
                CustomIconButton(
                  onPressed: () => Get.back(),
                  child: Image.asset(AppImages.close, height: 20.h),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Benefits Section with drop shadow
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 3,
                    spreadRadius: 1, // Uniform spread across all sides
                    offset: Offset(0, 0), // Shadow on all sides
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Benefits of your plan',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Column(
                    children: [
                      _buildBenefitItem(AppImages.checkEmote, 'Easy to use'),
                      _buildBenefitItem(
                        AppImages.booksEmote,
                        'Complete information',
                      ),
                      _buildBenefitItem(
                        AppImages.lockKeyEmote,
                        'Authentication guides',
                      ),
                      _buildBenefitItem(AppImages.cashEmote, 'Smart pricing'),
                      _buildBenefitItem(
                        AppImages.humanEmote,
                        'Created by industry experts',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Free Trial Section
            Text(
              'How Your Free Trial Works',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: AppColors.blackColor,
              ),
            ),

            SizedBox(height: 10.h),

            // Timeline Items each in separate container with shadow
            _buildTimelineItemContainer(
              'Today',
              'Unlock full access to all Picture bird premium\nfeatures',

              AppImages.lock,
            ),
            _buildTimelineItemContainer(
              'Day 1 - Day 6',
              'Enjoy your premium and get the most out of your\nfree trial',
              AppImages.emote,
            ),
            _buildTimelineItemContainer(
              'Day 7',
              'You will be charged - cancel anytime 24 hours\nbefore',
              AppImages.calender,
            ),

            SizedBox(height: 20.h),

            // Start Trial Button
            CustomButton(
              text: "Start My Free Trial Now",
              isGradient: true,
              bgColor: AppColors.primaryColor,
              textColor: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              width: double.infinity,
              height: 50.h,
              onclick: () {
                Get.to(() => AboutScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for benefit items with icon
  Widget _buildBenefitItem(String icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h, right: 8.w),
            child: Image.asset(icon, height: 16.h),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for timeline items wrapped in individual containers with shadow
  Widget _buildTimelineItemContainer(
    String day,
    String description,
    String icon,
  ) {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 3,
            spreadRadius: 1, // Uniform spread across all sides
            offset: Offset(0, 0), // Shadow on all sides
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(
        bottom: 12.h,
      ), // Adds spacing between timeline items
      child: Row(
        children: [
          Image.asset(icon, height: 24.h),
          SizedBox(width: 13.w), // Icon
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Day title on one line
              Text(
                day,
                style: TextStyle(
                  // fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
              ),

              // SizedBox(height: 8.h),
              // Row with Icon and description
              // SizedBox(width: 8.w),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
