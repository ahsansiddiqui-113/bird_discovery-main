import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class QuickFactsCard extends StatelessWidget {
  const QuickFactsCard({Key? key}) : super(key: key);

  Widget _factItem({
    required Color bgColor,
    required String iconAsset,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        // circle icon
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              iconAsset,
              width: 20.w,
              height: 20.w,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        // texts now wrapped in Expanded to avoid overflow
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Quick Facts',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 16.h),

          // 2x2 grid
          Row(
            children: [
              Expanded(
                child: _factItem(
                  bgColor: AppColors.lightPurpleBg,
                  iconAsset: AppImages.conservationIcon,
                  label: 'Conservation',
                  value: 'Least Concern',
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: _factItem(
                  bgColor: AppColors.lightGreenBg,
                  iconAsset: AppImages.habitatIcon,
                  label: 'Habitat',
                  value: 'Woodland Edges',
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _factItem(
                  bgColor: AppColors.lightBlueBg,
                  iconAsset: AppImages.seasonIcon,
                  label: 'Season',
                  value: 'Year-round',
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: _factItem(
                  bgColor: AppColors.lightYellowBg,
                  iconAsset: AppImages.sightingsIcon,
                  label: 'Sightings',
                  value: 'Common in area',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
