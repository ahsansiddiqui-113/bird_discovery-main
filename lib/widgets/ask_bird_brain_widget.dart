// lib/widgets/ask_birdbrain_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class AskBirdBrainCard extends StatelessWidget {
  final VoidCallback onPressed;
  const AskBirdBrainCard({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Image.asset(AppImages.messageIcon, width: 34.w, height: 34.w),
              SizedBox(width: 12.w),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    children: [
                      TextSpan(text: 'Ask '),
                      TextSpan(
                        text: 'BirdBrain',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: ' about your bird'),
                    ],
                  ),
                ),
              ),
              Image.asset(AppImages.arrowRightIcon, width: 24.w, height: 24.w),
            ],
          ),
        ),
      ),
    );
  }
}
