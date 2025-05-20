import 'package:bird_discovery/views/collection/widgets/collection_grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/collection_controller.dart';
import '../../controllers/explore_controller.dart';
import '../../utils/app_colors.dart' show AppColors;

class SearchCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(CollectionController());
    final exploreCtrl = Get.put(ExploreController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 14.w,
            color: AppColors.blackColor,
          ),
          onPressed: Get.back,
        ),
        title: Text(
          'Bird Collections',
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
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: AppColors.blackColor,
              size: 24.w,
            ),
            onPressed: () => print('More'),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // ── Search Bar ──────────────────────────
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.blackColor),
                suffixIcon: Icon(
                  Icons.filter_alt,
                  color: AppColors.primaryColor,
                ),
                filled: true,
                fillColor: AppColors.searchBarColor,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onChanged: (q) => print('Search: $q'),
            ),
            SizedBox(height: 16.h),

            // ── Filter / Pagination / View Toggle Row ─────────────────
            Obx(
              () => Row(
                children: [
                  // Rarity dropdown
                  GestureDetector(
                    onTap: () async {
                      // open a bottom sheet or dialog to pick a rarity
                      final choice = await showModalBottomSheet<String>(
                        context: context,
                        builder:
                            (_) => ListView(
                              children:
                                  [
                                        'Rarity',
                                        'S-Rarity',
                                        'A-Rarity',
                                        'B-Rarity',
                                        'C-Rarity',
                                      ]
                                      .map(
                                        (r) => ListTile(
                                          title: Text(r),
                                          onTap:
                                              () => Navigator.pop(context, r),
                                        ),
                                      )
                                      .toList(),
                            ),
                      );
                      if (choice != null) ctrl.setRarity(choice);
                    },
                    child: Container(
                      constraints: BoxConstraints(minWidth: 150.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.darkGreyColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            ctrl.selectedRarity.value,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 65.w),
                          Icon(
                            CupertinoIcons.chevron_down,
                            size: 20.w,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),

                  // Page indicator
                  Text(
                    '${ctrl.currentPage.value} of ${ctrl.totalPages}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 16.w),

                  // Grid / List toggle
                  IconButton(
                    icon: Icon(
                      Icons.grid_view,
                      color:
                          ctrl.isGridView.value
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                    ),
                    onPressed: () => ctrl.toggleView(true),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.view_list,
                      color:
                          ctrl.isGridView.value
                              ? AppColors.greyColor
                              : AppColors.primaryColor,
                    ),
                    onPressed: () => ctrl.toggleView(false),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Obx(
                () =>
                    ctrl.isGridView.value
                        ? GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 0.75,
                              ),
                          itemCount: exploreCtrl.allBirds.length,
                          itemBuilder: (_, i) {
                            final bird = exploreCtrl.allBirds[i];
                            return CollectionGridItem(
                              bird: bird,
                              onTap: () => print('Open ${bird.title}'),
                              onFavorite: () => print('Fav ${bird.title}'),
                            );
                          },
                        )
                        : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: exploreCtrl.allBirds.length,
                          itemBuilder: (_, i) {
                            final bird = exploreCtrl.allBirds[i];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: CollectionGridItem(
                                bird: bird,
                                onTap: () => print('Open ${bird.title}'),
                                onFavorite: () => print('Fav ${bird.title}'),
                              ),
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
