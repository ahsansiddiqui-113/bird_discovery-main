import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class RangeMapsSection extends StatelessWidget {
  const RangeMapsSection({Key? key}) : super(key: key);

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
          // Header row
          Row(
            children: [
              Image.asset(
                AppImages.worldIcon,
                width: 20.w,
                height: 20.w,
                color: AppColors.blackColor,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Range Maps',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => print('Options tapped'),
                child: Icon(
                  Icons.more_horiz,
                  size: 24.w,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Map placeholder with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              AppImages.mapPlaceholder,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
