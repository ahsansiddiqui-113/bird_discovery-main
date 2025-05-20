import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../widgets/custom_elevated_button.dart';

class ProCaptureCard extends StatelessWidget {
  final VoidCallback? onTry;

  const ProCaptureCard({Key? key, this.onTry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.pictureIcon, width: 24.w, height: 24.h),

              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  'ProCapture: Bird Photo Enhancement',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  AppImages.enhanceImage,
                  width: 150.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Turn your phone into a pro camera!',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 12.h),

                    CustomElevatedButton(
                      isGradient: false,
                      bgColor: Colors.white,
                      borderColor: AppColors.secondaryColor,
                      textColor: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      radius: 12.r,
                      height: 36.h,
                      onclick: onTry,
                      child: Text(
                        'Try Now',
                        style: GoogleFonts.quicksand(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
