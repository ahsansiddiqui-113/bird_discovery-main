import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class BirdTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subName;
  final VoidCallback onPressed;

  const BirdTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.subName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.sp),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subName != null) ...[
            SizedBox(height: 4.h),
            Text(
              subName!,
              style: TextStyle(fontSize: 12.sp, color: AppColors.greyColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
