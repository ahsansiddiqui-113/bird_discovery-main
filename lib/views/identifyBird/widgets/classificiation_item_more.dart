import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class ClassificationItem {
  final String label;
  final String value;
  ClassificationItem({required this.label, required this.value});
}

class ScientificClassificationCard extends StatelessWidget {
  final List<ClassificationItem> items;
  final VoidCallback? onLearnMore;

  const ScientificClassificationCard({
    Key? key,
    required this.items,
    this.onLearnMore,
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
          // Header
          Row(
            children: [
              Image.asset(
                AppImages.classificationIcon,
                width: 20.w,
                height: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Scientific Classification',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Items
          ...items.asMap().entries.map((entry) {
            final idx = entry.key;
            final itm = entry.value;
            return Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: Text(
                        '${itm.label}:',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        itm.value,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                if (idx != items.length - 1)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Divider(color: AppColors.lightGreyColor, height: 1),
                  ),
              ],
            );
          }),

          SizedBox(height: 20.h),

          // Learn More
          Center(
            child: GestureDetector(
              onTap: onLearnMore,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Learn More',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.secondaryColor,
                    size: 20.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
