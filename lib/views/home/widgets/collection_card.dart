import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../utils/app_colors.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({Key? key}) : super(key: key);

  Widget _rarityColumn(int value, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl =
        Get.isRegistered<HomeController>()
            ? Get.find<HomeController>()
            : Get.put(HomeController());

    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
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
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Your Collection',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 26.h),

            // Rarity row
            Row(
              children: [
                _rarityColumn(ctrl.sRarity.value, 'S-Rarity'),
                _rarityColumn(ctrl.aRarity.value, 'A-Rarity'),
                _rarityColumn(ctrl.bRarity.value, 'B-Rarity'),
                _rarityColumn(ctrl.cRarity.value, 'C-Rarity'),
              ],
            ),
            SizedBox(height: 16.h),

            // Divider
            Divider(color: AppColors.lightGreyColor, thickness: 1),

            SizedBox(height: 12.h),

            // Scores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Labels
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Collection Score:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Rarity Index:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Values
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ctrl.collectionScore.value,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ctrl.rarityIndex.value,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Image.asset(AppImages.trendUpIcon, height: 16.h),
                        // Icon(
                        //   Icons.trending_up,
                        //   size: 16.w,
                        //   color: AppColors.primaryColor,
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
