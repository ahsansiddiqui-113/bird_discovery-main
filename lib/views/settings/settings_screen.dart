// import 'package:bird_discovery/views/identifyBird/similar_idebntification_screen.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/onBoarding/choosePlan_screen.dart';
import 'package:bird_discovery/views/settings/widget/setting_item.dart';
import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/explore_controller.dart';
import '../../utils/app_colors.dart';
import 'edit_profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl =
        Get.isRegistered<ExploreController>()
            ? Get.find<ExploreController>()
            : Get.put(ExploreController());

    // Create a reactive variable for the switch state
    final autoSave = false.obs;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 16.w), // Proper padding
          height: 48.h,
          child: CustomIconButton(
            onPressed: () => Get.back(),
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subscription Section
            SettingItem(
              title: 'My Subscription',
              subtitle: 'Free',
              color: AppColors.secondaryColor,
              bgcolor: AppColors.lightBlueColor,
              trailing: CustomElevatedButton(
                onclick: () => Get.to(() => ChoosePlanScreen()),
                isGradient: true,
                width: 111.w,
                height: 44.h,
                child: Text(
                  'Upgrade Now',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              // trailing: ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     elevation: 0,
              //     backgroundColor: AppColors.primaryColor,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12.w,
              //       vertical: 6.h,
              //     ),
              //   ),
              //   child: Text('Upgrade Now', style: TextStyle(fontSize: 12.sp)),
              // ),
              imageUrl: AppImages.crownIcon,
            ),

            SizedBox(height: 23.h),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.lightGreyColor,
              ),
              child: Column(
                children: [
                  // Profile Section
                  SettingItem(
                    imageUrl: AppImages.profileIcon,
                    title: 'Edit Profile',
                    // trailing: Icon(Icons.arrow_forward_ios, size: 12.w),
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    onTap: () => Get.to(() => const ProfileEditScreen()),
                  ),
                  SizedBox(height: 12.h),

                  // Language Section
                  SettingItem(
                    imageUrl: AppImages.languageIcon,
                    title: 'Set Language',
                    subtitle: 'English',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    //onTap: () => Get.to(() => NearbySpotsScreen()),
                  ),
                  SizedBox(height: 12.h),

                  // Auto Save Section - Now with working toggle
                  Obx(
                    () => SettingItem(
                      imageUrl: AppImages.autoSave,
                      title: 'Auto Save Photos to Album',
                      subtitle:
                          'All of our latest photos are automatically created by our client.',
                      trailing: Switch(
                        value: autoSave.value,
                        onChanged: (value) {
                          autoSave.value = value;
                          // Add your save logic here, like:
                          // ctrl.updateAutoSavePreference(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.lightGreyColor,
              ),
              child: Column(
                children: [
                  SettingItem(
                    imageUrl: AppImages.termIcon,
                    title: 'Terms & Conditions',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  SettingItem(
                    imageUrl: AppImages.policyIcon,
                    title: 'Privacy Policy',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  // Help Section
                  SettingItem(
                    imageUrl: AppImages.helpIcon,
                    title: 'Help & FAQs',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  // App Info Section
                  SettingItem(
                    imageUrl: AppImages.infoIcon,
                    title: 'App Info',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),

                  // Share Section
                  SettingItem(
                    imageUrl: AppImages.shareIconn,
                    title: 'Share with Friends',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  // Suggestion Section
                  SettingItem(
                    imageUrl: AppImages.suggestionIcon,
                    title: 'Suggestion',
                    trailing: Image.asset(AppImages.arrowRight, height: 14.h),
                    subtitle:
                        'Thank you only like to recognize, please contact us a book with us.',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            // Legal Sections
          ],
        ),
      ),
    );
  }
}
