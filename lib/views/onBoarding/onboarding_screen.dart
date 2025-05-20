import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/bottom_sheet_widget.dart';
import '../../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController onBoardingController = Get.put(
    OnboardingController(),
  );
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Initialize the current page to 0 when the screen loads
    onBoardingController.currentPage.value = 0;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        child: Column(
          children: [
            // Header with back button, title, and skip button
            SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button (always visible but disabled on the first page)
                  InkWell(
                    onTap:
                        onBoardingController.currentPage.value > 0
                            ? () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                            : null, // Disable tap on the first page
                    child: CustomIconButton(
                      child: Image.asset(AppImages.arrowLeft, height: 16.h),
                    ),
                  ),
                  // Title
                  Container(
                    width: 102.w,
                    height: 28.h,
                    child: Image.asset(
                      AppImages.appLogoLinear,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Text(
                  //   'BirdBrain',
                  //   style: TextStyle(
                  //     fontFamily: 'Gilroy',
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 18.sp,
                  //     color: AppColors.blackColor,
                  //   ),
                  // ),
                  // Skip button (only visible when not on last page)
                  onBoardingController.currentPage.value <
                          onBoardingController.onBoardingData.length - 1
                      ? InkWell(
                        onTap: () {
                          // Navigate to the Sign-in screen or other action
                          // Get.offAll(() => const SigninScreen());
                          //Here it will go to last index
                          pageController.jumpToPage(
                            onBoardingController.onBoardingData.length - 1,
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.blackColor,
                          ),
                        ),
                      )
                      : SizedBox(width: 48.w), // Placeholder for alignment
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // PageView content
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingController.onBoardingData.length,
                onPageChanged: (index) {
                  // Update the current page index
                  onBoardingController.currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  final data = onBoardingController.onBoardingData[index];
                  return Column(
                    children: [
                      // Image container
                      Container(
                        padding: EdgeInsets.all(10.w),
                        height: 420.h,
                        width: 343.w,
                        child: Image.asset(data['image']!, fit: BoxFit.fill),
                      ),

                      // Container(
                      //   height: 400.h,
                      //   // padding: EdgeInsets.all(10.w),
                      //   decoration: BoxDecoration(
                      //     // color: AppColors.lightBlueColor,
                      //     borderRadius: BorderRadius.circular(20.r),
                      //   ),
                      //   child: Image.asset(data['image']!, fit: BoxFit.contain),
                      // ),
                      SizedBox(
                        height: 20.h,
                      ), // Add spacing between image & title
                      // Page indicators
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onBoardingController.onBoardingData.length,
                            (indicatorIndex) {
                              bool isActive =
                                  onBoardingController.currentPage.value ==
                                  indicatorIndex;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 8.h,
                                width: isActive ? 32.w : 8.w,
                                decoration: BoxDecoration(
                                  color:
                                      isActive
                                          ? AppColors.secondaryColor
                                          : AppColors.darkGreyColor,
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                              );
                            },
                          ),
                        );
                      }),

                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23.w),
                        child: Column(
                          children: [
                            Text(
                              data['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: AppColors.blackColor,
                              ),
                            ),

                            SizedBox(height: 20.h),

                            // Subtitle
                            Text(
                              data['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Title
                      SizedBox(height: 30.h),

                      const Spacer(),

                      // Next/Get Started button
                    ],
                  );
                },
              ),
            ),
            CustomButton(
              text:
                  onBoardingController.currentPage.value ==
                          onBoardingController.onBoardingData.length - 1
                      ? "Get Started"
                      : "Next",
              isGradient: true,
              bgColor: AppColors.primaryColor,
              textColor: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              width: 343.w,
              height: 50.h,
              onclick: () {
                if (onBoardingController.currentPage.value ==
                    onBoardingController.onBoardingData.length - 1) {
                  // Show BottomSheet on the last page
                  // To show the bottom sheet from any screen:
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const PremiumBottomSheet(),
                  );
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
