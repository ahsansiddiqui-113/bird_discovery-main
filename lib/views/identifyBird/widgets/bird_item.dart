import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirdItem extends StatelessWidget {
  final String birdName;
  final String birdScientificName;
  final String imageUrl; // New parameter for dynamic image
  final VoidCallback onTap;

  const BirdItem({
    Key? key,
    required this.birdName,
    required this.birdScientificName,
    required this.imageUrl, // Initialize the dynamic image URL here
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(12.w),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(
              10.r,
            ), // Rounded corners with radius 10
            child: Image.asset(
              imageUrl, // Use dynamic imageUrl here
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover, // To ensure the image fits within the circle
            ),
          ),
          title: Text(
            birdName,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
          subtitle: Text(
            birdScientificName,
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          // trailing: Icon(Icons.arrow_forward_ios, size: 20.w),
          trailing: Padding(
            padding: EdgeInsets.only(right: 7.w),
            child: Image.asset(
              AppImages.arrowRight,
              height: 13.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
