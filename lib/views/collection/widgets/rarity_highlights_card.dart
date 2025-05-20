// lib/widgets/rarity_highlights_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/collection_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class RarityHighlightsCard extends StatelessWidget {
  const RarityHighlightsCard({Key? key}) : super(key: key);

  Gradient _badgeGradient(String grade) {
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

  Widget _buildRow(RarityHighlightModel item) {
    if (item.isOverall) {
      return Column(
        children: [
          Divider(color: AppColors.lightGreyColor, thickness: 1),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  gradient: _badgeGradient(item.grade),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.grade,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    // normal rows
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item.label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              item.description,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
            ),
          ),
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              gradient: _badgeGradient(item.grade),
              borderRadius: BorderRadius.circular(12.r),
            ),
            alignment: Alignment.center,
            child: Text(
              item.grade,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CollectionController>();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightGreyColor),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Image.asset(AppImages.graphIcon, width: 20.w, height: 20.w),
              SizedBox(width: 8.w),
              Text(
                'Rarity Highlights',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Three highlight rows
          ...ctrl.rarityHighlights.map(_buildRow),

          // Overall row
          _buildRow(ctrl.overallSignificance),
        ],
      ),
    );
  }
}
