import 'dart:async';
// import 'dart:ui';

import 'package:bird_discovery/controllers/identify_bird_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/identifyBird/questions_screens/bird_activity_screen.dart';
import 'package:bird_discovery/views/identifyBird/questions_screens/bird_color_screen.dart';
import 'package:bird_discovery/views/identifyBird/questions_screens/bird_location_screen.dart';
import 'package:bird_discovery/views/identifyBird/questions_screens/bird_seeing_date_screen.dart';
import 'package:bird_discovery/views/identifyBird/questions_screens/bird_size_screen.dart';
import 'package:bird_discovery/views/identifyBird/similar_idebntification_screen.dart';
import 'package:bird_discovery/views/identifyBird/widgets/loading_dialog.dart';
// import 'package:bird_discovery/views/onBoarding/choosePlan_screen.dart';
import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IdentifyBirdScreen extends StatefulWidget {
  const IdentifyBirdScreen({super.key});

  @override
  State<IdentifyBirdScreen> createState() => _IdentifyBirdScreenState();
}

class _IdentifyBirdScreenState extends State<IdentifyBirdScreen> {
  final IdentifyBirdController identifyBirdController =
      Get.isRegistered<IdentifyBirdController>()
          ? Get.find<IdentifyBirdController>()
          : Get.put(IdentifyBirdController());

  var _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomIconButton(
            onPressed: () => Get.back(),
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
            // Icon(
            //   Icons.arrow_back_ios_new,
            //   color: Colors.black,
            //   size: 16.sp,
            // ),
          ),
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            child: Image.asset(
              AppImages.moreHorzIcon,
              // height: 16.h,
              width: 20.w,
            ),
            // Icon(
            //   Icons.more_horiz_outlined,
            //   color: Colors.black,
            //   size: 16.sp,
            // ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 16.w),
        title: Text(
          'Ask BirdBrain',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Image.asset(AppImages.birdAskImage, height: 60.h),
                // CustomIconButton(child: Image.asset(AppImages.onboarding1)),
                // SizedBox(width: 10.w),
                Container(
                  // height: 54.h,
                  decoration: BoxDecoration(
                    color: AppColors.searchBarColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0).w,
                    child: Text(
                      'Simply answer a few questions to find the \nbird in your mind.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Obx(
              () => Text(
                identifyBirdController
                    .questionList[identifyBirdController.pageNo.value - 1],
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                SizedBox(
                  width: 290.w,
                  child: Obx(
                    () => LinearProgressIndicator(
                      value: identifyBirdController.indicatorBar.value,
                      minHeight: 10.h,
                      borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      backgroundColor: AppColors.lightGreyColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 7.w),
                Obx(
                  () => Text(
                    '0${identifyBirdController.pageNo.value}',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  '/05',
                  style: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              // height: 320.h,
              child: PageView(
                controller: _pageViewController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BirdSizeScreen(),
                  BirdColorScreen(),
                  BirdActivityScreen(),
                  BirdSeeingDateScreen(),
                  BirdLocationScreen(),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Obx(
              () => CustomElevatedButton(
                isGradient: true,
                child: Text(
                  identifyBirdController.pageNo.value != 5 ? 'Next' : 'Submit',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onclick: () {
                  if (identifyBirdController.pageNo.value < 5) {
                    identifyBirdController.pageNo.value++;
                    _pageViewController.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Get.dialog(barrierDismissible: false, LoadingDialog());
                    Timer(Duration(seconds: 3), () {
                      Get.off(() => SimilarIdentificationScreen());
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
