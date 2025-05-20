import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/explore_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import 'feed_filter_screen.dart';

class FoodFilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ExploreController>();
    final categoryTitle = ctrl.selectedCategory.value!.title;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomIconButton(
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          '$categoryTitle / ${ctrl.selectedFood.value}',
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
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Food (active)
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(() => FoodFilterScreen()),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Food',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                ctrl.selectedFood.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 16.w,
                            color: AppColors.darkGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),

                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(() => FeederFilterScreen()),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.darkGreyColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Feeder',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.darkGreyColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                ctrl.selectedFeeder.value,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 16.w,
                            color: AppColors.darkGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 36.h),

            Expanded(
              child: Obx(
                () => GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.8,
                  children: List.generate(ctrl.foodOptions.length, (i) {
                    final option = ctrl.foodOptions[i];
                    final isSel = ctrl.selectedFood.value == option;
                    return GestureDetector(
                      onTap: () {
                        ctrl.setFood(option);
                        Get.back();
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color:
                              //     isSel
                              //         ? AppColors.secondaryColor
                              //         : Colors.transparent,
                              border: Border.all(
                                color:
                                    isSel
                                        ? AppColors.primaryColor
                                        : AppColors.darkGreyColor,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                ctrl.foodImages[i],
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            option,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color:
                                  isSel
                                      ? AppColors.primaryColor
                                      : AppColors.blackColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
