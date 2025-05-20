import 'package:bird_discovery/controllers/auth_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/auth/get_started_screen.dart';
import 'package:bird_discovery/views/auth/signup_screen.dart';
import 'package:bird_discovery/views/home/widgets/bottom_nav_bar_screen.dart';
import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:bird_discovery/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthController authController =
      Get.isRegistered<AuthController>()
          ? Get.find<AuthController>()
          : Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              CustomIconButton(
                backgroundColor: AppColors.whiteColor,
                onPressed: () => Get.back(),
                child: Image.asset(AppImages.arrowLeft, height: 16.h),
              ),
              SizedBox(height: 15.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 29.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                        child: Image.asset(AppImages.authLogo),
                      ),
                      SizedBox(height: 19.h),
                      Text(
                        'Sign in to your account',
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CustomTextfield(
                        labelText: 'Email Address',
                        controller: emailController,
                      ),
                      SizedBox(height: 15.h),
                      Obx(
                        () => CustomTextfield(
                          controller: passwordController,
                          labelText: 'Password',
                          obsecureText: authController.isPasswordObsecure.value,
                          suffixIcon: AppImages.obsecureOffIcon,
                          onSuffixIconTap:
                              () => authController.togglePasswordVisibility(),
                        ),
                      ),
                      SizedBox(height: 13.h),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: authController.isRememberMe.value,
                              onChanged:
                                  (_) => authController.toggleCheckboxRemeber(),
                              activeColor: AppColors.primaryColor,
                              checkColor: AppColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Remember for 30 days',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot password',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 31.h),
                      CustomElevatedButton(
                        isGradient: true,
                        height: 60.h,
                        onclick: () async {
                          if (authController.isLoading.value) return;
                          if (authController.validateSignin(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          )) {
                            final result = await authController.loginUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                            if (result) {
                              Get.snackbar('Success', 'Login Successful');
                              Get.offAll(() => BottomNavBarScreen());
                            }
                          }
                        },
                        child: Obx(
                          () =>
                              authController.isLoading.value
                                  ? CircularProgressIndicator(
                                    color: AppColors.whiteColor,
                                  )
                                  : Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                        ),
                      ),
                      SizedBox(height: 29.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.offAll(() => SignupScreen()),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23.h),
                      Divider(color: AppColors.lightGreyColor),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        isGradient: false,
                        height: 56,
                        bgColor: Colors.transparent,
                        borderColor: AppColors.lightGreyColor,
                        onclick: () async {
                          await authController.appleSignUp();
                          Get.offAll(() => BottomNavBarScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.appleIcon),
                            SizedBox(width: 7.w),
                            Text('Continue with Apple'),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomElevatedButton(
                        isGradient: false,
                        height: 56,
                        bgColor: Colors.transparent,
                        borderColor: AppColors.lightGreyColor,
                        onclick: () async {
                          await authController.googleSignUp();
                          Get.offAll(() => BottomNavBarScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.googleIcon),
                            SizedBox(width: 7.w),
                            Text('Continue with Google'),
                          ],
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
