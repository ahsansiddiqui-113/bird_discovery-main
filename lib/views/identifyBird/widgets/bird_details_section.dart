import 'package:bird_discovery/views/identifyBird/identify_bird_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/bird_analytics_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../widgets/ask_bird_brain_widget.dart';

class BirdDetailsSection extends StatelessWidget {
  const BirdDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = Get.find<BirdAnalyticsController>().birdDetails.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── Title + Confidence ───────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              details.scientificName,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                '${details.confidence} Confidence',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        // ─── Date & Location Row ─────────────
        Row(
          children: [
            //Icon(Icons.calendar_today, size: 16.w, color: AppColors.greyColor),
            Image.asset(
              AppImages.calenderIcon,
              width: 16.w,
              height: 16.w,
              color: AppColors.greyColor,
            ),
            SizedBox(width: 6.w),
            Text(
              details.dateText,
              style: TextStyle(fontSize: 12.sp, color: AppColors.blackColor),
            ),
            SizedBox(width: 16.w),
            //Icon(Icons.location_on, size: 16.w, color: AppColors.greyColor),
            Image.asset(
              AppImages.locationIcon,
              width: 16.w,
              height: 16.w,
              color: AppColors.greyColor,
            ),
            SizedBox(width: 6.w),
            Text(
              details.location,
              style: TextStyle(fontSize: 12.sp, color: AppColors.blackColor),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        Row(
          children: [
            // Safe for Plants
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.lightGreyColor),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 34.w,
                    height: 34.w,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImages.treeIcon,
                      width: 16.w,
                      height: 26.w,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Safe for Plants',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),

            // No-Toxic
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.lightGreyColor),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: Image.asset(
                        AppImages.tickIcon,
                        width: 10.w,
                        height: 10.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'No-toxic',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 16.h),

        AskBirdBrainCard(onPressed: () => Get.to(() => IdentifyBirdScreen())),
      ],
    );
  }
}
