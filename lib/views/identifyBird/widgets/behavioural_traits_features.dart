import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class BehavioralTraitsCard extends StatelessWidget {
  final List<String> traits;
  final String seasonalAppearance;
  final String diet;

  const BehavioralTraitsCard({
    Key? key,
    required this.traits,
    required this.seasonalAppearance,
    required this.diet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Behavioral Traits title
          Text(
            'Behavioral Traits',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 12.h),

          // Bullet‐listed traits
          ...traits.map((t) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              children: [
                // bullet icon
                Image.asset(
                  AppImages.blueTickIcon,
                  width: 34.w,
                  height: 34.w,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    t,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          )),

          SizedBox(height: 12.h),
          // Seasonal Appearance
          Text(
            'Seasonal Appearance',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            seasonalAppearance,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 12.h),

          // Diet
          Text(
            'Diet',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            diet,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
