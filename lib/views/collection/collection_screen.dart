import 'package:bird_discovery/views/collection/search_screen.dart';
import 'package:bird_discovery/views/collection/widgets/collection_recent_activity_section.dart';
import 'package:bird_discovery/views/collection/widgets/collection_stats_card.dart';
import 'package:bird_discovery/views/collection/widgets/my_collection_widget.dart';
import 'package:bird_discovery/views/collection/widgets/rarity_highlights_card.dart';
import 'package:bird_discovery/views/identifyBird/identify_bird_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../widgets/ask_bird_brain_widget.dart';
import '../explore/search_screen.dart';
import '../reading/discovery_learn_screen.dart';

class CollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        actions: [
          // Search icon
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () {
                Get.to(() => SearchCollectionScreen());
              },
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.searchIcon,
                    width: 20.w,
                    height: 20.w,
                  ),
                ),
              ),
            ),
          ),

          // Share icon
          /*  Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () => print('Share'),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.shareIcon,
                    width: 20.w,
                    height: 20.w,
                  ),
                ),
              ),
            ),
          ),*/
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              AskBirdBrainCard(
                onPressed: () => Get.to(() => IdentifyBirdScreen()),
              ),
              SizedBox(height: 16.h),
              MyCollectionSection(
                onAddTap: () {
                  Get.to(()=>DiscoveryLearnScreen());
                  print('Add Collection tapped');
                }
              ),
              CollectionStatsCard(),
              RarityHighlightsCard(),
              CollectionRecentActivitySection(),
              SizedBox(height: 26.h),
            ],
          ),
        ),
      ),
    );
  }
}
