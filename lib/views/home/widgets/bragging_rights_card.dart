import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../utils/app_colors.dart';

class BraggingRightsCard extends StatelessWidget {
  const BraggingRightsCard({Key? key}) : super(key: key);

  Widget _statItem(
    Color bg,
    Color iconC,
    String icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          // child: Icon(icon, size: 20.w, color: iconC),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              icon,
              // height: 2.h,
              // width: 2.w,
              // fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12.sp, color: AppColors.blackColor),
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl =
        Get.isRegistered<HomeController>()
            ? Get.find<HomeController>()
            : Get.put(HomeController());

    return Column(
      children: [
        // ── Container with shadow ───────────────────────
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Bragging Rights',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 16.h),

              // Stats grid (2 x 2)
              /*Wrap(
                spacing: 24.w,
                runSpacing: 16.h,
                children: [
                  _statItem(
                    AppColors.lightPurpleBg,
                    AppColors.lightPurpleIcon,
                    Icons.emoji_events,
                    'Rarest Find',
                    ctrl.topFindPercent.value,
                  ),
                  _statItem(
                    AppColors.lightGreenBg,
                    AppColors.lightGreenIcon,
                    Icons.star,
                    'Collection Rank',
                    ctrl.collectionRank.value,
                  ),
                  _statItem(
                    AppColors.lightBlueBg,
                    AppColors.lightBlueIcon,
                    Icons.location_on,
                    'Location',
                    ctrl.locationCount.value,
                  ),
                  _statItem(
                    AppColors.lightYellowBg,
                    AppColors.lightYellowIcon,
                    Icons.diamond,
                    'Streak Status',
                    ctrl.streakStatus.value,
                  ),
                ],
              ),*/
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _statItem(
                          AppColors.lightPurpleBg,
                          AppColors.lightPurpleIcon,
                          AppImages.trophyIcon,
                          'Rarest Find',
                          ctrl.topFindPercent.value,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _statItem(
                          AppColors.lightGreenBg,
                          AppColors.lightGreenIcon,
                          AppImages.rankIcon,
                          'Collection Rank',
                          ctrl.collectionRank.value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: _statItem(
                          AppColors.lightBlueBg,
                          AppColors.lightBlueIcon,
                          AppImages.mapPinIcon,
                          'Location',
                          ctrl.locationCount.value,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _statItem(
                          AppColors.lightYellowBg,
                          AppColors.lightYellowIcon,
                          AppImages.streakIcon,
                          'Streak Status',
                          ctrl.streakStatus.value,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // ── Alert bar ────────────────────────────────────
        Container(
          height: 75.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.alertColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Image.asset(AppImages.sirenIcon, height: 24.h),
              // Icon(Icons.warning, size: 24.w, color: Colors.white),
              SizedBox(width: 12.w),

              // texts
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ctrl.alertTitle.value,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      ctrl.alertMessage.value,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Navigate button
              SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () => print('Navigate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    elevation: 0,
                  ),
                  child: Text(
                    'Navigate',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
