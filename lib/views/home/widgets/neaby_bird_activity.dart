import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../utils/app_colors.dart';

class NearbyBirdActivity extends StatelessWidget {
  const NearbyBirdActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find<HomeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.mapPinIcon,
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.black,
                ),
                // Icon(
                //   Icons.location_on,
                //   size: 20.w,
                //   color: AppColors.blackColor,
                // ),
                SizedBox(width: 8.w),
                Text(
                  'Nearby Bird Activity',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () => print('View all tapped'),
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        SizedBox(
          height: 155.h,
          child: ListView.separated(
            padding: EdgeInsets.only(right: 10.w),
            scrollDirection: Axis.horizontal,
            itemCount: ctrl.nearbyBirds.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, i) {
              final bird = ctrl.nearbyBirds[i];
              return GestureDetector(
                onTap: () => print('Tapped ${bird.title}'),
                child: SizedBox(
                  width: 120.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          bird.imageUrl,
                          width: 120.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        bird.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
