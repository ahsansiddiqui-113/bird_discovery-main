// lib/widgets/recent_activity_section.dart

import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/widgets/recent_activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../utils/app_colors.dart';
import '../recent_activity_screen.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find<HomeController>();

    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.clockIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                        // Icon(Icons.access_time, size: 20.w, color: Colors.red),
                        SizedBox(width: 8.w),
                        Text(
                          'Recent Activity',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print('View all');
                        Get.to(() => AllRecentActivityScreen());
                      },
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
              ),

              // List
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: List.generate(
                    //ctrl.recentActivities.length, (i)
                    ctrl.recentActivities.length > 3
                        ? 3
                        : ctrl.recentActivities.length,
                    (i) {
                      final item = ctrl.recentActivities[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: RecentActivityItem(
                          imageUrl: item.imageUrl,
                          title: item.title,
                          dateAdded: item.dateAdded,
                          grade: item.grade,
                          onTap: () => print('Tapped ${item.title}'),
                        ),
                      );
                    },
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
