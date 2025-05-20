import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controllers/collection_controller.dart';
import '../../../utils/app_colors.dart';

class CollectionRecentActivityTile extends StatelessWidget {
  final CollectionRecentActivityModel item;
  final VoidCallback? onTap;

  const CollectionRecentActivityTile({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  Gradient get _badgeGradient {
    switch (item.grade) {
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
              item.imageUrl,
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
                  item.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Added: ${item.dateAdded}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              gradient: _badgeGradient,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.grade,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2.h),
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
