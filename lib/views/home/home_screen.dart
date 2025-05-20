// lib/views/home/home_screen.dart

import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/bird_analytics/bird_analytics_screen.dart';
import 'package:bird_discovery/views/home/enhanceImage/capture_image_screen.dart';
import 'package:bird_discovery/views/home/enhanceImage/enhance_image_screen.dart';
import 'package:bird_discovery/views/home/nearby_spot_screen.dart';
import 'package:bird_discovery/views/home/voice_identifier/voice_identifier_screen.dart';
import 'package:bird_discovery/views/home/widgets/bragging_rights_card.dart';
import 'package:bird_discovery/views/home/widgets/collection_card.dart';
import 'package:bird_discovery/views/home/widgets/gradient_text_widget.dart';
import 'package:bird_discovery/views/home/widgets/identify_option_widget.dart';
import 'package:bird_discovery/views/home/widgets/neaby_bird_activity.dart';
import 'package:bird_discovery/views/home/widgets/pro_capture_widget.dart';
import 'package:bird_discovery/views/home/widgets/recent_activity_section.dart';
import 'package:bird_discovery/views/identifyBird/identify_bird_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/ask_bird_brain_widget.dart';
// import 'nearby_spot_screen_bird_brain_widget.dart';

import 'nearby_spot_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void _onPhoto() => Get.to(() => CaptureImageScreen());
    void _onPhoto() {
      Get.to(() => CaptureImageScreen());
    }

    void _onSound() {
      Get.to(() => BirdSoundScreen());
    }

    void _onFilter() {
      // Get.to(() => IdentifyBirdScreen());
    }

    void _onHotspots() {
      Get.to(() => NearbySpotsScreen());
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.appLogoLinear,
                fit: BoxFit.fill,
                // width: 128.w,
                height: 30.h,
              ),
              // GradientText(
              //   text: 'BirdBrain',
              //   style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
              //   gradient: AppColors.linearGradient,
              // ),
              SizedBox(height: 16.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.searchBarColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.searchBarIcon, height: 24.h),
                    // Icon(Icons.search, size: 24.w, color: AppColors.blackColor),
                    SizedBox(width: 8.w),
                    Text(
                      'Search over 30k species',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              Container(
                // margin: EdgeInsets.symmetric(vertical: 24.h),
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
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  children: [
                    IdentifyOption(
                      gradient: AppColors.linearGradient,
                      icon: AppImages.cameraIcon2,
                      title: 'Identify\nBy Photo',
                      onPressed: _onPhoto,
                    ),
                    IdentifyOption(
                      gradient: AppColors.identifyBySoundGradient,
                      icon: AppImages.waveIcon,
                      title: 'Identify\nBy Sound',
                      onPressed: _onSound,
                    ),
                    IdentifyOption(
                      background: AppImages.mapBtnImage,
                      gradient: AppColors.linearGradient,
                      icon: AppImages.mapIcon,
                      title: 'Birding\nHotspots',
                      onPressed: _onHotspots,
                    ),
                    IdentifyOption(
                      gradient: AppColors.identifyByFilterGradient,
                      icon: AppImages.filterIcon,
                      title: 'Identify\nBy Filtering',
                      onPressed: _onFilter,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              AskBirdBrainCard(
                onPressed: () => Get.to(() => IdentifyBirdScreen()),
              ),
              ProCaptureCard(
                onTry: () {
                  Get.to(() => CaptureImageScreen());
                },
              ),

              CollectionCard(),
              BraggingRightsCard(),
              NearbyBirdActivity(),
              RecentActivitySection(),

              SizedBox(height: 26.h),
            ],
          ),
        ),
      ),
    );
  }
}
