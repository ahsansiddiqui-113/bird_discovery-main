import 'package:bird_discovery/controllers/bird_reading_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/views/reading/tabs/discover_tab.dart';
import 'package:bird_discovery/views/reading/tabs/favorites_tab.dart';

import 'package:bird_discovery/views/reading/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscoveryLearnScreen extends StatefulWidget {
  const DiscoveryLearnScreen({super.key});

  @override
  State<DiscoveryLearnScreen> createState() => _DiscoveryLearnScreenState();
}

class _DiscoveryLearnScreenState extends State<DiscoveryLearnScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.lightGrayColor,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0.w),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    gradient: AppColors.linearGradient,
                    // color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: AppColors.black,
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [Tab(text: 'Discover'), Tab(text: 'Favorites')],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [DiscoverTab(), FavoritesTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
