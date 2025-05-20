import 'dart:ui';

import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_images.dart';
// import 'package:get/get.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0).w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(AppImages.birdLOGO, height: 100.h,width: 100.w,),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                height: 150.h,
                width: 150.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Text(
                        'Identify',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        // height: 150.h,
                        width: 130.w,
                        height: 130.w,
                        child: CircularProgressIndicator(
                          // strokeAlign: 1,
                          backgroundColor: AppColors.lightGreyColor,
                          color: AppColors.secondaryColor,
                          strokeWidth: 15.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 51.h,
              //   decoration: BoxDecoration(
              //     color: AppColors.whiteColor,
              //     borderRadius: BorderRadius.all(Radius.circular(15.r)),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.all(6).w,
              //     child: Row(
              //       children: [
              //         SizedBox(
              //           height: 18.h,
              //           width: 18.w,
              //           child: CircularProgressIndicator(
              //             color: AppColors.secondaryColor,
              //           ),
              //         ),
              //         SizedBox(width: 10.w),
              //         Text(
              //           'Location:',
              //           style: TextStyle(
              //             color: AppColors.blackColor,
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
