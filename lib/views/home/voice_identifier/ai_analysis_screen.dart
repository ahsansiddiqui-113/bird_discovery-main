import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AiAnalysisScreen extends StatelessWidget {
  const AiAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Analyzing... ',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h), // Space after app bar
              Center(child: Image.asset('assets/images/wave.png',)),
              SizedBox(height: 15.h),
              // Voice identification text
              Center(
                child: Text(
                  'Wait for a moment AI Identifying the voice ',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              // Progress percentage
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // The circular progress indicator
                    SizedBox(
                      width: 121, // Increase width for a larger circle
                      height: 115,
                      child: CircularProgressIndicator(
                        value: 62 / 100, // This sets the percentage
                        strokeWidth: 5.0, // Width of the progress circle
                        backgroundColor:
                            AppColors
                                .whiteColor, // Background color of the circle
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryColor,
                        ), // Color of the progress
                      ),
                    ),
                    // The percentage text in the middle of the circle
                    Text(
                      '62%',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              // The images section
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // The identifyCircle image at the bottom
                      Positioned(
                        top: 8,
                        bottom: -290,
                        child: Image.asset(
                          'assets/images/identifier_circle.png',
                          width: 500.w,
                          height: 500.h,
                        ),
                      ),
                      // The identifyBird image at the center
                      Positioned(
                        top: 160.h,
                        child: Image.asset(
                          'assets/images/identify_bird.png',
                          width: 105.w,
                          height: 115.h,
                        ),
                      ),
                      // The birdScanner image at the left bottom of the bird
                      Positioned(
                        //left: 10.w,
                        right: 94,
                        bottom: 25.h,
                        child: Image.asset(
                          'assets/images/scanner.png',
                          width: 70.w,
                          height: 70.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
