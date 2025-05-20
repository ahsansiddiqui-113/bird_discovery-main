import 'package:bird_discovery/views/collection/search_screen.dart';
import 'package:bird_discovery/views/home/bird_analytics/bird_analytics_screen.dart';
import 'package:bird_discovery/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/custom_bottom_nav.dart';
import '../../collection/collection_screen.dart';
import '../../explore/explore_screen.dart';
import '../../settings/settings_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // init controller
    final NavigationController ctrl =
        Get.isRegistered<NavigationController>()
            ? Get.find<NavigationController>()
            : Get.put(NavigationController());

    return Scaffold(
      // screens
      body: Obx(() {
        switch (ctrl.selectedIndex) {
          case 0:
            return const HomeScreen();
          case 1:
            return CollectionScreen();
          case 3:
            return const ExploreScreen();
          case 4:
            return const SettingScreen();
          default:
            return const BirdAnalyticsScreen(); // or a placeholder
        }
      }),

      // center FAB
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60.w,
        width: 60.w,
        child: FloatingActionButton(
          onPressed: () => ctrl.setIndex(2),
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.add, size: 28.w),
        ),
      ),

      // custom bottom bar
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Home Screen'));
//   }
// }

/*class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Collection Screen'));
  }
}*/
