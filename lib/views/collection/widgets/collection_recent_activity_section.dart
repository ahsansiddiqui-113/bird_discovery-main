import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/recent_activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/collection_controller.dart';
import '../../../utils/app_colors.dart';
import 'collection_recent_activity_tile.dart';

class CollectionRecentActivitySection extends StatelessWidget {
  const CollectionRecentActivitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CollectionController>();

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
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImages.clockIcon, height: 20.h),
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
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children:
                      ctrl.recentActivities
                          .take(3)
                          .map(
                            (item) => Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: CollectionRecentActivityTile(
                                item: item,
                                onTap: () => print('Tapped ${item.title}'),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
