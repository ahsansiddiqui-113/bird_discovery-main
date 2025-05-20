import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/auth/get_started_screen.dart';
import 'package:bird_discovery/widgets/custom_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/planScreen_controller.dart';
import '../../utils/app_colors.dart';

class ChoosePlanScreen extends StatelessWidget {
  ChoosePlanScreen({super.key});

  final PlanController planController = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      body: Column(
        children: [
          // Top image with rounded bottom corners
          Stack(
            children: [
              Container(
                // height: 341.h,
                width: double.infinity,
                child: Image.asset(AppImages.choosePlanImage, fit: BoxFit.fill),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30.r),
                //     bottomRight: Radius.circular(30.r),
                //   ),
                //   image: const DecorationImage(
                //     image: ,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
              // Back button in circle
              // Positioned(
              //   top: 50.h,
              //   left: 20.w,
              //   child: Container(
              //     width: 38.w,
              //     height: 38.h,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       shape: BoxShape.circle,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.1),
              //           blurRadius: 10,
              //           spreadRadius: 1,
              //         ),
              //       ],
              //     ),
              //     child: Center(
              //       child: IconButton(
              //         icon: Icon(Icons.arrow_back_ios, size: 16.w),
              //         onPressed: () => Get.back(),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 34.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      onPressed: () => Get.back(),
                      child: Image.asset(AppImages.arrowLeft, height: 16.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Content area
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose your Plan',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Plan Options in Column layout
                    Column(
                      children: [
                        _buildPlanOption('Free Trial', 'With 7-day free trial'),
                        SizedBox(height: 20.h),
                        _buildPlanOption('Monthly', 'HK \$35.99/m'),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Free Trial toggle with enhanced layout
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Light gray color
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(
                          10,
                        ), // Padding inside the container
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Distribute space between elements
                          crossAxisAlignment:
                              CrossAxisAlignment.center, // Center vertically
                          children: [
                            // Plan details (Text part)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Free trial enabled',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'No commitment, cancel anytime',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            // Increased size toggle switch on the right side
                            Transform.scale(
                              scale:
                                  1.5, // Increase the size of the toggle button (1.5x)
                              child: Switch(
                                value: planController.isFreeTrialEnabled.value,
                                onChanged: planController.toggleFreeTrial,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center, // Center the row content horizontally
                      children: [
                        Container(
                          width: 24, // Width of the circle
                          height: 24, // Height of the circle
                          child: Image.asset(
                            AppImages.circleCheckIcon,
                            height: 16.h,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ), // Space between the circle and the text
                        Text(
                          'No Payment Now',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    // Continue Button
                    CustomButton(
                      text: "Continue",
                      isGradient: true,
                      bgColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      width: double.infinity,
                      height: 50.h,
                      onclick: () {
                        // Get.to(() => GetStartedScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanOption(String plan, String description) {
    return Obx(() {
      bool isSelected = planController.selectedPlan.value == plan;
      final primaryColor =
          AppColors.primaryColor; // Use primary color from AppColors

      return GestureDetector(
        onTap: () => planController.selectPlan(plan),
        child: Container(
          width: double.infinity, // Take full width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.whiteColor,
            border: Border.all(
              color: isSelected ? primaryColor : Colors.grey.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Plan details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              // Checkmark circle on the right
              Container(
                width: 21.w,
                height: 21.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected
                          ? AppColors.primaryColor
                          : Colors
                              .transparent, // Fill the circle with primary color when selected
                  border: Border.all(
                    color:
                        isSelected
                            ? AppColors.primaryColor
                            : AppColors.blackColor.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  size: 12.w,
                  color:
                      isSelected
                          ? Colors.white
                          : AppColors.blackColor.withOpacity(
                            0.7,
                          ), //n selected, gray when not
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
