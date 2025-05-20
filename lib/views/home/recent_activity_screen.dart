import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/widgets/recent_activity_tile.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../utils/app_colors.dart';

class AllRecentActivityScreen extends StatelessWidget {
  const AllRecentActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomIconButton(
            backgroundColor: AppColors.whiteColor,
            onPressed: () => Get.back(),
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
          ),
        ),
        title: Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.searchBarColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  // Icon(Icons.search, size: 24.w, color: AppColors.blackColor),
                  Image.asset(AppImages.searchBarIcon, height: 24.h),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by items',
                        border: InputBorder.none,
                      ),
                      // onChanged: ctrl.searchItems,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Section title
            Text(
              'All Recent Activity',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 12.h),

            // List of items
            Expanded(
              child: ListView.separated(
                itemCount: ctrl.recentActivities.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (_, i) {
                  final it = ctrl.recentActivities[i];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: RecentActivityItem(
                      imageUrl: it.imageUrl,
                      title: it.title,
                      dateAdded: it.dateAdded,
                      grade: it.grade,
                      onTap: () => print('Tapped ${it.title}'),
                    ),
                  );
                },
              ),
            ),

            // (Optional) pagination controls here…
          ],
        ),
      ),
    );
  }
}
