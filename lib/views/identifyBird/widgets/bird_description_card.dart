import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class BirdDescriptionCard extends StatelessWidget {
  final String description;
  final List<String> tags;
  final String rarity;
  final LinearGradient outerGradient;
  final List<Color> innerGradientColors;

  const BirdDescriptionCard({
    super.key,
    required this.description,
    required this.tags,
    required this.rarity,
    this.outerGradient = AppColors.BirdRarityOuterGradient,
    this.innerGradientColors = AppColors.BirdRarityInnerGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: outerGradient.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with description and rarity
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              // Rarity Indicator
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 13.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: innerGradientColors,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      rarity[0],
                      style: TextStyle(
                        fontSize: 42.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Rarity',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Tags Row
          Wrap(
            spacing: 8.w,
            children:
                tags.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tag = entry.value;
                  return _buildTag(tag, index);
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, int index) {
    Color backgroundColor;

    switch (index) {
      case 0:
        backgroundColor = AppColors.UnCommonColor;
        break;
      case 1:
        backgroundColor = AppColors.RegionalColor;
        break;
      default:
        backgroundColor = Colors.white.withOpacity(0.2);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
