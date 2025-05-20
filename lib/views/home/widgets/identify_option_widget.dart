import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentifyOption extends StatelessWidget {
  final Gradient gradient;
  final String? background;
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const IdentifyOption({
    this.background,
    required this.gradient,
    required this.icon,
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          gradient: background != null ? null : gradient,
          borderRadius: BorderRadius.circular(12.r),
          image:
              background !=
                      null // Check if background is not null
                  ? DecorationImage(
                    image: AssetImage(
                      background!,
                    ), // Use background if it's not null
                    fit: BoxFit.cover, // Optional: Adjust how the image fits
                  )
                  : null,
        ),
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Image.asset(icon, width: 28.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
