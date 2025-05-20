import 'package:bird_discovery/controllers/bird_reading_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/views/reading/widgets/article_card.dart';
import 'package:bird_discovery/views/reading/widgets/reading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  final BirdReadingController ctrl =
      Get.isRegistered<BirdReadingController>()
          ? Get.find<BirdReadingController>()
          : Get.put(BirdReadingController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 22.h),
        SizedBox(
          height: 46.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ctrl.categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: InkWell(
                  onTap: () {
                    ctrl.selectedCategory.value = index;
                    ctrl.fetchArticles();
                  },
                  child: Obx(
                    () => Container(
                      height: 46.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(
                          color:
                              ctrl.selectedCategory.value == index
                                  ? Colors.transparent
                                  : AppColors.lightGreyColor,
                          width: 1.w,
                        ),
                        color:
                            ctrl.selectedCategory.value == index
                                ? AppColors.tapColorSkyBlue
                                : Colors.transparent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 4.h,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              ctrl.categories[index].icon,
                              // height: 38.h,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              ctrl.categories[index].name,
                              style: TextStyle(
                                fontFamily: 'GeneralSans',
                                fontSize: 15.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 30.h),
        Obx(
          () =>
              ctrl.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                    child: ListView.builder(
                      itemCount: ctrl.articles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: ArticleCard(
                            article: ctrl.articles[index],
                            onPress: () {
                              Get.to(
                                () => ReadingScreen(
                                  article: ctrl.articles[index],
                                  onSave: () {
                                    if (ctrl.favorites
                                        .where(
                                          (val) =>
                                              val.userName ==
                                              ctrl.articles[index].userName,
                                        )
                                        .isEmpty) {
                                      ctrl.favorites.add(ctrl.articles[index]);
                                    } else {
                                      ctrl.favorites.removeWhere(
                                        (val) =>
                                            val.userName ==
                                            ctrl.articles[index].userName,
                                      );
                                    }
                                  },
                                ),
                              );
                              print('Index of article ${index}');
                            },
                          ),
                        );
                      },
                    ),
                  ),
        ),
      ],
    );
  }
}
