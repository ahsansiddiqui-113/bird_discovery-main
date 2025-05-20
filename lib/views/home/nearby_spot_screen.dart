import 'package:bird_discovery/controllers/home_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/BirdDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/bird_identifier_controller.dart';
import '../../widgets/custom_button.dart';
import '../identifyBird/widgets/bird_item.dart';

class NearbySpotsScreen extends StatelessWidget {
  final RxInt _selectedTabIndex = 0.obs;
  final HomeController controller = Get.put(HomeController());
  final BirdIdentifierController ctrl = Get.put(BirdIdentifierController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLocationAccessDialog();
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Icon(
            //   Icons.location_on,
            //   color: AppColors.darkGreyColor,
            //   size: 20.sp,
            // ),
            Image.asset(
              AppImages.mapPin4,
              height: 20.h,
              color: AppColors.darkGreyColor,
            ),
            SizedBox(width: 8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nearby spots',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  'Hong Kong',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ), // Adjust vertical padding further
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.crossHair, height: 18.h, width: 15.w),
                  SizedBox(width: 3.w),
                  Text(
                    '100km',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Image.asset(AppImages.arrow_left, height: 15.h, width: 15.w),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],

        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.mapImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 60.h), // Space for bottom sheet
              ],
            ),
          ),
          // Bottom Sheet with Tabs
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Tab Bar
                    Obx(
                      () => Row(
                        children: [
                          _buildTab(0, 'Spots'),
                          _buildTab(1, 'Likely Birds'),
                        ],
                      ),
                    ),
                    // Tab Content
                    Obx(
                      () => Container(
                        padding: EdgeInsets.all(16.w),
                        height: 200.h, // Adjust as needed
                        child:
                            _selectedTabIndex.value == 0
                                ? _buildSpotsContent()
                                : _buildBirdsContent(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    return Expanded(
      child: InkWell(
        onTap: () => _selectedTabIndex.value = index,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight:
                      _selectedTabIndex.value == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                  color:
                      _selectedTabIndex.value == index
                          ? AppColors.primaryColor
                          : AppColors.blackColor,
                ),
              ),
              if (_selectedTabIndex.value == index)
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  height: 2.0,
                  width: 60.0,
                  color: AppColors.primaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpotsContent() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(AppImages.mapPin, height: 24.h, width: 24.h),
            SizedBox(width: 6.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hong Kong',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  'Hong Kong',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Image.asset(AppImages.mapPin, height: 24.h, width: 24.h),
            SizedBox(width: 8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nearby spots',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  'Hong Kong',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBirdsContent() {
    return ListView.builder(
      itemCount: ctrl.birdListHotspot.length,
      itemBuilder: (context, index) {
        return BirdItem(
          birdName: ctrl.birdListHotspot[index].name,
          birdScientificName: ctrl.birdListHotspot[index].scientificName,
          imageUrl: ctrl.birdListHotspot[index].imageUrl,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BirdDetailPage(birdId: index),
              ),
            );
          },
        );
      },
    );
  }

  void _showLocationAccessDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        contentPadding: EdgeInsets.all(24.w),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Explore birds and hotspots around you',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(AppImages.dialogMap),
              Text(
                'Allow location access to discover which birds are near you & where you can see them',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.start,
                maxLines: 2, // Limits text to 2 lines
                overflow:
                    TextOverflow
                        .ellipsis, // Adds ellipsis if text exceeds two lines
              ),
              SizedBox(height: 9.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AppImages.shieldCheck, height: 18.h, width: 18.w),
                  SizedBox(width: 2.w),
                  Text(
                    'Your location will never be tracked or\nshared with anyone',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: "Next",
                isGradient: true,
                bgColor: AppColors.primaryColor,
                textColor: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                width: double.infinity,
                height: 50.h,
                onclick: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
