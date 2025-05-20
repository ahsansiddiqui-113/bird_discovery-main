import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class FoodHabitsSection extends StatelessWidget {
  const FoodHabitsSection({Key? key}) : super(key: key);

  // simple data holder
  static final _foods = [
    {
      'image': AppImages.blackSeed,
      'label': 'Black oil\nsunflower seeds',
    },
    const {
      'image': AppImages.corn,
      'label': 'Cracked Corn',
    },
    const {
      'image': AppImages.seed,
      'label': 'Hulled Sunflower Seeds',
    },
    const {
      'image': AppImages.blackSeed,
      'label': 'Cracked Corn',
    },
    const {
      'image': AppImages.corn,
      'label': 'Cracked Corn',
    },
  ];

  static const _feeders = [
    {
      'image': AppImages.ground,
      'label': 'Ground',
    },
    {
      'image': AppImages.platform,
      'label': 'Platform',
    },
    {
      'image': AppImages.blackSeed,
      'label': 'Hopper',
    },
    {
      'image': AppImages.corn,
      'label': 'Tube',
    },
    {
      'image': AppImages.seed,
      'label': 'Window',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // outer card
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Row(
            children: [
              Image.asset(
                AppImages.foodIcon,
                width: 20.w,
                height: 20.w,
                color: AppColors.blackColor,
              ),
              SizedBox(width: 8.w),
              Text(
                'Food Habits',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // FOOD subsection
          Container(
            decoration: BoxDecoration(
              color: AppColors.searchBarColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 100.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _foods.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (_, i) {
                      final food = _foods[i];
                      return SizedBox(
                        width: 80.w,
                        child: Column(
                          children: [
                            Image.asset(
                              food['image']!,
                              width: 64.w,
                              height: 64.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              food['label']!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // FEEDER subsection
          Container(
            decoration: BoxDecoration(
              color: AppColors.searchBarColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feeder',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 100.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _feeders.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (_, i) {
                      final feeder = _feeders[i];
                      return SizedBox(
                        width: 80.w,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40.r),
                              child: Image.asset(
                                feeder['image']!,
                                width: 64.w,
                                height: 64.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              feeder['label']!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
