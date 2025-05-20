import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/auth/signin_screen.dart';
import 'package:bird_discovery/views/auth/signup_screen.dart';
import 'package:bird_discovery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 500.h,
              // width: double.infinity,
              child: Image.asset(
                AppImages.getStartedImage,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Welcome To',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
            SizedBox(height: 8.h),
            Image.asset(
              AppImages.appLogoLinear,
              height: 45.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 32.h),
            CustomButton(
              isGradient: true,
              text: 'Login',
              onclick: () => Get.to(() => SigninScreen()),
            ),
            SizedBox(height: 12.h),
            CustomButton(
              isGradient: false,
              text: 'Sign Up',
              onclick: () => Get.to(() => SignupScreen()),
              textColor: AppColors.secondaryColor,
              borderColor: AppColors.primaryColor,
              bgColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
