import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/explore/widgets/bird_tile_widget.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:bird_discovery/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/explore_controller.dart';
import '../../utils/app_colors.dart';
import 'bird_selected_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl =
        Get.isRegistered<ExploreController>()
            ? Get.find<ExploreController>()
            : Get.put(ExploreController());

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios,color: AppColors.blackColor, size: 20.w),
        //   onPressed: Get.back,
        // ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomIconButton(
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Search',
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
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.searchBarColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Image.asset(AppImages.searchBarIcon, height: 20.h),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                onChanged: ctrl.onSearch,
              ),
            ),
            SizedBox(height: 16.h),

            // Grid of results
            Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 1,
                  ),
                  itemCount: ctrl.filteredCategories.length,
                  itemBuilder: (ctx, i) {
                    final item = ctrl.filteredCategories[i];
                    return BirdTile(
                      imageUrl: item.imageUrl,
                      title: item.title,
                      onPressed: () {
                        ctrl.selectCategory(item);
                        // navigate to the details screen
                        Get.to(() => BirdSelectedScreen());
                      },
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
