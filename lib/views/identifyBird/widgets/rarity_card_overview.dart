import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

enum RarityGrade { S, A, B, C }

extension RarityGradient on RarityGrade {
  LinearGradient get gradient {
    switch (this) {
      case RarityGrade.A:
        return AppColors.aGradeGradient;
      case RarityGrade.B:
        return AppColors.bGradeGradient;
      case RarityGrade.C:
        return AppColors.cGradeGradient;
      case RarityGrade.S:
      default:
        return AppColors.sGradeGradient;
    }
  }
}

class RarityOverviewCard extends StatelessWidget {
  final RarityGrade grade;
  final String description;

  const RarityOverviewCard({
    Key? key,
    required this.grade,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final grad = grade.gradient;


    final bgColor = grad.colors.first.withOpacity(0.3);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          // description
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
                height: 1.4,
              ),
            ),
          ),

          SizedBox(width: 6.w),

          // grade badge
          Container(
            width: 90.w,
            height: 90.w,
            decoration: BoxDecoration(
              gradient: grad,
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.all(6.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  grade.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Rarity',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
