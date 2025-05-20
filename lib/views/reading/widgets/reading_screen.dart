import 'package:bird_discovery/controllers/bird_reading_controller.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class ReadingScreen extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback onSave;
  const ReadingScreen({super.key, required this.article, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                CustomIconButton(
                  backgroundColor: AppColors.lightGreyColor,
                  onPressed: () => Get.back(),
                  child: Image.asset(AppImages.arrowLeft, height: 16.h),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                        fontFamily: 'GeneralSans',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      article.subtitle,
                      style: TextStyle(
                        fontFamily: 'GeneralSans',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Container(
                          height: 40.h,
                          child: ClipRRect(
                            // Ensure the image respects the border radius
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.r),
                            ),
                            child: Image.asset(
                              article.userImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        // CircleAvatar(
                        //   foregroundImage: AssetImage(article.userImage),
                        //   backgroundColor: Colors.transparent,
                        // ),
                        SizedBox(width: 10.w),
                        Text(
                          article.userName,
                          style: TextStyle(
                            fontFamily: 'GeneralSans',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '.',
                          style: TextStyle(
                            fontFamily: 'GeneralSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGreyColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          article.date,
                          style: TextStyle(
                            fontFamily: 'GeneralSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGreyColor,
                          ),
                        ),
                        Spacer(),
                        CustomIconButton(
                          backgroundColor: Colors.transparent,
                          onPressed: onSave,
                          child: Image.asset(
                            AppImages.bookmarkIcon,
                            height: 24.h,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(AppImages.moreHorzIcon, height: 24.h),
                      ],
                    ),
                    SizedBox(height: 17.h),
                    // TODO dummy data below
                    Container(child: Image.asset(AppImages.articleBird)),
                    SizedBox(height: 15.h),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Neque odio velit metus scelerisque aliquet tempus. Faucibus consequat egestas rhoncus donec vulputate praesent.\n\nLorem ipsum dolor sit amet consectetur. Neque odio velit metus scelerisque aliquet tempus. Faucibus consequat egestas rhoncus donec vulputate praesent.\n\nLorem ipsum dolor sit amet consectetur. Neque odio velit metus scelerisque aliquet tempus. Faucibus consequat egestas rhoncus donec vulputate praesent.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
