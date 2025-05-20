import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String imageUrl; // Change from IconData to String for image path
  final Color? color; // Optional color for the icon background
  final Color? bgcolor; // Optional color for the icon background

  const SettingItem({
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    required this.imageUrl, // Change from icon to imageUrl
    this.color, // Added color parameter
    this.bgcolor, // Added color parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        // margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: bgcolor ?? AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withOpacity(0.1),
          //       spreadRadius: 1,
          //       blurRadius: 5,
          //     ),
          //   ],
        ),
        child: Row(
          children: [
            // Image in circle
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: color ?? Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(imageUrl, height: 10.h),
              ),
              // child: Padding(
              //   padding: const EdgeInsets.all(5),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(
              //     36.r,
              //   ), // To keep the image in circle
              //   child: Center(
              //     child: Image.asset(
              //       imageUrl, // Use image URL for the image
              //       fit:
              //           BoxFit
              //               .contain, // To cover the space within the circle
              //     ),
              //   ),
              // ),
              // ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),

            if (trailing != null)
              Padding(padding: EdgeInsets.only(left: 8.w), child: trailing!),
          ],
        ),
      ),
    );
  }
}
