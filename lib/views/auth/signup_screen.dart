import 'package:bird_discovery/controllers/auth_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/auth/get_started_screen.dart';
import 'package:bird_discovery/views/auth/signin_screen.dart';
import 'package:bird_discovery/widgets/custom_elevated_button.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:bird_discovery/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController authController =
      Get.isRegistered<AuthController>()
          ? Get.find<AuthController>()
          : Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
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
                onPressed: () => Get.off(() => GetStartedScreen()),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                            child: Image.asset(AppImages.authLogo),
                          ),
                          SizedBox(height: 19.h),
                          Text(
                            'Sign up to create account',
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Unleash your pets health with AI analyzer',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      CustomTextfield(
                        labelText: 'Full Name',
                        controller: nameController,
                      ),
                      SizedBox(height: 15.h),
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
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        isGradient: true,
                        height: 60.h,
                        onclick: () async {
                          if (authController.isLoading.value) return;
                          if (authController.validateSignup(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          )) {
                            final result = await authController.signUpUser(
                              emailController.text.trim(),
                              nameController.text.trim(),
                              passwordController.text.trim(),
                            );
                            if (result) {
                              Get.snackbar('Success', 'Signup Successful');
                              Get.off(() => SigninScreen());
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
                                    'Sign Up',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.lightGreyColor,
                              thickness: 1.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.hintColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.lightGreyColor,
                              thickness: 1.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        isGradient: false,
                        height: 56,
                        bgColor: Colors.transparent,
                        borderColor: AppColors.lightGreyColor,
                        onclick: () async {
                          await authController.appleSignUp();
                          Get.offAll(() => SigninScreen());
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
                          Get.offAll(() => SigninScreen());
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
