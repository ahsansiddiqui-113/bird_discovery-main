import 'package:bird_discovery/controllers/bird_analytics_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/home/bird_analytics/widgets/quick_facts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../identifyBird/widgets/bird_description_card.dart';

class ShareMyFindScreen extends StatefulWidget {
  const ShareMyFindScreen({super.key});
  @override
  State<ShareMyFindScreen> createState() => _BirdAnalyticsScreenState();
}

class _BirdAnalyticsScreenState extends State<ShareMyFindScreen>
    with TickerProviderStateMixin {
  final BirdAnalyticsController ctrl =
      Get.isRegistered<BirdAnalyticsController>()
          ? Get.find<BirdAnalyticsController>()
          : Get.put(BirdAnalyticsController());
  int _currentPage = 0;
  final RxInt _selectedTab = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                            onPressed: () => Get.back(),
                            child: Image.asset(
                              AppImages.arrowLeft,
                              height: 16.h,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  AppImages
                                      .birdBrain, // Replace with your desired AppImages image
                                  height: 22.h,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  'BirdBrain',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomIconButton(
                            child: Image.asset(
                              AppImages.moreHorzIcon,
                              height: 24.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      SizedBox(
                        height: 264.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            PageView.builder(
                              itemCount: 3,
                              onPageChanged:
                                  (page) => setState(() => _currentPage = page),
                              itemBuilder: (context, index) {
                                final asset =
                                    index == 0
                                        ? AppImages.bird1
                                        : index == 1
                                        ? AppImages.bird2
                                        : AppImages.bird3;

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14.r),
                                    child: Image.asset(
                                      asset,
                                      width: double.infinity,
                                      height: 264.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 7.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                    ),
                                    height: 15.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      color:
                                          _currentPage == index
                                              ? AppColors.whiteColor
                                              : Colors.transparent,
                                      border: Border.all(
                                        color: AppColors.whiteColor,
                                        width: 0.5.w,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color:
                                            _currentPage == index
                                                ? AppColors.primaryColor
                                                : AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Lesser Violetear,',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Image.asset(
                            AppImages.calenderIcon,
                            width: 13,
                            color: AppColors.blackColor.withOpacity(0.5),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'Today, 2:24 pm',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.blackColor.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 9.w),
                          Image.asset(
                            AppImages.locationIcon,
                            width: 15,
                            color: AppColors.blackColor.withOpacity(0.5),
                          ),
                          SizedBox(width: 2.w),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Backyard',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.blackColor.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      BirdDescriptionCard(
                        description:
                            "A legendary collector's item with exceptional investment potential & cultural significance.",
                        tags: ["Uncommon", "Regional"],
                        rarity: "B",
                      ),
                      SizedBox(height: 16.h),
                      QuickFactsSection(),
                      SizedBox(height: 25.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Save To Album',
                              isGradient: false,
                              bgColor: Colors.transparent,
                              textColor: AppColors.blackColor,
                              borderColor: AppColors.blackColor.withOpacity(
                                0.2,
                              ),
                              onclick: () {
                                // Your save to album logic
                              },
                            ),
                          ),
                          SizedBox(width: 12.w), // Space between buttons
                          Expanded(
                            child: CustomButton(
                              text: 'Share',
                              isGradient: false,
                              bgColor: AppColors.primaryColor,
                              textColor: Colors.white,
                              onclick: () {
                                // Your share logic
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
