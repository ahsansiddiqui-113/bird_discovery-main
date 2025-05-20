import 'package:bird_discovery/controllers/bird_reading_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback onPress;
  const ArticleCard({super.key, required this.article, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        height: 175.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.lightGreyColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30.h,
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
                          // Container(
                          //   height: 30.h,
                          //   child: CircleAvatar(
                          //     foregroundImage: AssetImage(article.userImage),
                          //     backgroundColor: Colors.transparent,
                          //   ),
                          // ),
                          SizedBox(width: 5.w),
                          Text(
                            article.userName,
                            style: TextStyle(
                              fontFamily: 'GeneralSans',
                              fontSize: 14.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text('.'),
                          SizedBox(width: 4.w),
                          Text(
                            article.date,
                            style: TextStyle(
                              fontFamily: 'GeneralSans',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        article.title,
                        style: TextStyle(
                          fontFamily: ' GeneralSans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 80.h,
                    child: ClipRRect(
                      // Ensure the image respects the border radius
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      child: Image.asset(
                        article.articleImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 80.h,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: AssetImage(article.articleImage),
                  //     ),
                  //     borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  //   ),
                  //   // child: Image.asset(article.articleImage, fit: BoxFit.cover),
                  // ),
                ],
              ),
              SizedBox(height: 21.h),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 25.h,
                      width: 110.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: article.tags.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 22.h,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreyColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.r),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 17.w,
                                  vertical: 6.h,
                                ),
                                child: Text(
                                  article.tags[index],
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                    fontFamily: 'GeneralSans',
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Image.asset(AppImages.bookmarkIcon, height: 15.h),
                  SizedBox(width: 10.w),
                  Image.asset(AppImages.moreHorzIcon, height: 15.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
