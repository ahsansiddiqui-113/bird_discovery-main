import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/widgets/custom_button.dart';
import 'package:bird_discovery/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGreyColor,
          ),
          child: IconButton(
            icon: Image.asset(AppImages.arrowLeft, width: 20.w, height: 20.h),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Profile Edit',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGreyColor,
            ),
            child: IconButton(
              icon: Image.asset(
                AppImages.settingsIcon,
                width: 20.w,
                height: 20.h,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                // User profile picture
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueColor.withOpacity(
                      0.5,
                    ), // Light blue background color
                    borderRadius: BorderRadius.circular(
                      14.0,
                    ), // Rounded corners
                    border: Border.all(
                      color: AppColors.black.withOpacity(0.1),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0, // Avatar size
                            backgroundImage: AssetImage(
                              'assets/images/Scene01.png',
                            ),
                          ),
                          SizedBox(width: 10), // Space between avatar and name
                          Text(
                            'Robert Fox',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.arrowRight, height: 20.h),
                        onPressed: () => Get.back(),
                        padding: EdgeInsets.only(right: 4),
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35.h),
                CustomTextfield(
                  controller: nameController,
                  labelText: 'Your Name',
                  hintText: 'Enter your name',

                ),
                SizedBox(height: 19.h),
                CustomTextfield(
                  controller: emailController,
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                ),
                // Name field
                // TextField(
                //   controller: nameController,
                //   decoration: InputDecoration(
                //     labelText: 'Your Name',
                //     hintText: 'Enter your name',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                // Email field
                // TextField(
                //   controller: emailController,
                //   decoration: InputDecoration(
                //     labelText: 'Email Address',
                //     hintText: 'Enter your email',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                SizedBox(height: 25.h),
                // Date of Birth field
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: CustomTextfield(
                      controller: TextEditingController(
                        text: DateFormat('dd MMM yyyy').format(selectedDate),
                      ),
                      labelText: 'Date Of Birth',
                      hintText: 'Select your date of birth',
                      suffixIcon: AppImages.calenderIcon,
                      // decoration: InputDecoration(
                      //   labelText: 'Date Of Birth',
                      //   hintText: 'Select your date of birth',
                      //   suffixIcon: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: 24.0,
                      //       vertical: 16,
                      //     ),
                      //     child: Image.asset(
                      //       AppImages.calenderIconn,
                      //       height: 7,
                      //     ),
                      //   ),
                      //   border: OutlineInputBorder(),
                      // ),
                      // readOnly: true,
                      // onTap: () {
                      //   // Add date picker logic here
                      // },
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () => _selectDate(context),
                //   child: AbsorbPointer(
                //     child: TextField(
                //       controller: TextEditingController(
                //         text: DateFormat('dd MMM yyyy').format(selectedDate),
                //       ),
                //       decoration: InputDecoration(
                //         labelText: 'Date Of Birth',
                //         hintText: 'Select your date of birth',
                //         suffixIcon: Padding(
                //           padding: EdgeInsets.symmetric(
                //             horizontal: 24.0,
                //             vertical: 16,
                //           ),
                //           child: Image.asset(
                //             AppImages.calenderIconn,
                //             height: 7,
                //           ),
                //         ),
                //         border: OutlineInputBorder(),
                //       ),
                //       readOnly: true,
                //       onTap: () {
                //         // Add date picker logic here
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(height: 19.h),
                // Location field
                CustomTextfield(
                  controller: locationController,
                  labelText: 'Your Location',
                  hintText: 'Enter your location',
                ),
                // TextField(
                //   controller: locationController,
                //   decoration: InputDecoration(
                //     labelText: 'Your Location',
                //     hintText: 'Enter your location',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(
                16.0,
              ), // Padding to give space from the screen edge
              child: CustomButton(
                text: "Save",
                isGradient: true,
                bgColor: AppColors.primaryColor,
                textColor: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                width: double.infinity,
                height: 50.h,
                onclick: () {
                  // Your action here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
