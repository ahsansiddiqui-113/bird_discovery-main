import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/explore/widgets/bird_tile_widget.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/explore_controller.dart';
import '../../utils/app_colors.dart';
import 'feed_filter_screen.dart';
import 'food_filter_screen.dart';

class BirdSelectedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ExploreController>();
    final cat = ctrl.selectedCategory.value!;

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
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, size: 20.w, color: AppColors.greyColor,),
        //   onPressed: Get.back,
        // ),
        title: Text(
          cat.title,
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
            // Filters row
            Row(
              children: [
                // Food filter
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FoodFilterScreen());
                    },
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
                                'Food',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.darkGreyColor,
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
                // Feeder filter
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FeederFilterScreen());
                    },
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
            SizedBox(height: 16.h),

            // Count
            Text(
              '${ctrl.birdCount} Birds',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12.h),

            // Grid
            Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 1,
                  ),
                  itemCount: ctrl.filteredBirds.length,
                  itemBuilder: (_, i) {
                    final b = ctrl.filteredBirds[i];
                    return BirdTile(
                      imageUrl: b.imageUrl,
                      title: b.title,
                      subName: b.scientificName,
                      onPressed: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
