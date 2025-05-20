import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import '../utils/app_colors.dart';
// import '../utils/app_images.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  Widget _navItem({
    required String icon,
    required String label,
    required int index,
    required NavigationController ctrl,
  }) {
    final bool isSel = ctrl.selectedIndex == index;
    final color = isSel ? AppColors.primaryColor : AppColors.darkGreyColor;

    return GestureDetector(
      onTap: () => ctrl.setIndex(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 50.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(icon, size: 24.w, color: color),
            Image.asset(icon, width: 25.w, height: 25.h, color: color),
            SizedBox(height: 4.h),
            Text(
              label.tr,

              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NavigationController ctrl = Get.find<NavigationController>();
    return Obx(() {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.r,
        elevation: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left side
              Row(
                children: [
                  _navItem(
                    // iconPath: AppImages.homeIcon,
                    icon: AppImages.homeIcon,
                    label: 'Home',
                    index: 0,
                    ctrl: ctrl,
                  ),
                  SizedBox(width: 32.w),
                  _navItem(
                    //iconPath: AppImages.collectionIcon,
                    icon: AppImages.collectionIcon,
                    label: 'Collection',
                    index: 1,
                    ctrl: ctrl,
                  ),
                ],
              ),
              // right side
              Row(
                children: [
                  _navItem(
                    // iconPath: AppImages.exploreIcon,
                    icon: AppImages.exploreIcon,
                    label: 'Explore',
                    index: 3,
                    ctrl: ctrl,
                  ),
                  SizedBox(width: 32.w),
                  _navItem(
                    //iconPath: AppImages.settingsIcon,
                    icon: AppImages.settingsIcon,
                    label: 'Settings',
                    index: 4,
                    ctrl: ctrl,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
