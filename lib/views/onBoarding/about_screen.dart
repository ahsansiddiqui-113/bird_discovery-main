// import 'dart:async';

import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
// import 'package:bird_discovery/views/auth/get_started_screen.dart';
// import 'package:bird_discovery/widgets/bottom_sheet_widget.dart';
import 'package:bird_discovery/widgets/custom_button.dart';
import 'package:bird_discovery/widgets/dialog_boxes/rate_us_dialog.dart';
// import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:bird_discovery/widgets/others/stars_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

final List<Map<String, String>> dummyReviews = [
  {
    'image': 'assets/images/user.png',
    'name': 'Jordan',
    'age': '28',
    'review':
        'Finally, an app that gives me the complete picture on my sneakers. Saved me from buying fakes twice!',
    'stars': '4.9',
  },
  {
    'image': 'assets/images/user.png',
    'name': 'Jordan',
    'age': '28',
    'review':
        'Finally, an app that gives me the complete picture on my sneakers. Saved me from buying fakes twice!',
    'stars': '4.9',
  },
  {
    'image': 'assets/images/user.png',
    'name': 'Jordan',
    'age': '28',
    'review':
        'Finally, an app that gives me the complete picture on my sneakers. Saved me from buying fakes twice!',
    'stars': '4.9',
  },
];

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48.h,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomIconButton(
            onPressed: () => Get.back(),
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
          ),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 400.h,
                width: 343.w,
                child: Image.asset(AppImages.aboutApp, fit: BoxFit.fill),
              ),
              SizedBox(height: 30.h),
              Text(
                'Help Us Build Our Vision',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15.h),
              Image.asset(AppImages.stars, height: 32.h),
              SizedBox(height: 30.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Gilroy',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'BlueBird',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' is designed for people like you, who want to search birds by image & sound.',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Gilroy',
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Giving us a '),
                        TextSpan(
                          text: '5 star rating ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              'helps us to further build our vision, and help more users get amazing AI features Bird Identifier.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Indentifier Intelligence Has Arrived',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Gilroy',
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Thousands of '),
                        TextSpan(
                          text: 'BirdBrain ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              'users have already transformed their experience. Build your own impressive birds collection and join a community of passionate birds collectoins today!',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 240.h,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyReviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        child: Container(
                          width: 210.w,
                          height: 170.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 5,
                                spreadRadius:
                                    1, // Uniform spread across all sides
                                offset: Offset(0, 0), // Shadow on all sides
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0).w,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset(
                                        dummyReviews[index]['image']!,
                                        // AppImages.onboarding1,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      dummyReviews[index]['name']!,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      dummyReviews[index]['age']!,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.darkGreyColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  dummyReviews[index]['review']!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                SizedBox(
                                  height: 22.h,
                                  child: Row(
                                    children: [
                                      // StarsRow(),
                                      Image.asset(
                                        AppImages.stars,
                                        width: 120.w,
                                        height: 20.h,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        dummyReviews[index]['stars']!,
                                        style: GoogleFonts.quicksand(
                                          fontSize: 14.sp,
                                          color: AppColors.goldenColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        // TextStyle(
                                        //   fontSize: 18.sp,
                                        //   color: AppColors.goldenColor,
                                        //   fontWeight: FontWeight.w700,
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                isGradient: true,
                text: 'Continue',
                onclick: () => showRateUsDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
