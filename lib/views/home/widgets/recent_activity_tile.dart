import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class RecentActivityItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateAdded;
  final String grade;
  final VoidCallback? onTap;

  const RecentActivityItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.dateAdded,
    required this.grade,
    this.onTap,
  }) : super(key: key);
  Gradient get _badgeGradient {
    switch (grade) {
      case 'A':
        return AppColors.aGradeGradient;
      case 'B':
        return AppColors.bGradeGradient;
      case 'C':
        return AppColors.cGradeGradient;
      default:
        return AppColors.sGradeGradient;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              imageUrl,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Added: $dateAdded',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Container(
              // width:  36.w,
              // height: 36.h,
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                gradient: _badgeGradient,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: Text(
                grade,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
