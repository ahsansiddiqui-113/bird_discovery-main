import 'package:bird_discovery/controllers/identify_bird_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/views/identifyBird/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BirdActivityScreen extends StatefulWidget {
  const BirdActivityScreen({super.key});

  @override
  State<BirdActivityScreen> createState() => _BirdActivityScreenState();
}

class _BirdActivityScreenState extends State<BirdActivityScreen> {
  final IdentifyBirdController identifyBirdController =
      Get.isRegistered<IdentifyBirdController>()
          ? Get.find<IdentifyBirdController>()
          : Get.put(IdentifyBirdController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView.builder(
        itemCount: identifyBirdController.birdActivityList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ListTileWidget(
              hasTrailing: false,
              leading: SizedBox(
                height: 10.h,
                width: 10.w,
                child: Checkbox(value: false, onChanged: (value) {}),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  identifyBirdController.birdActivityList[index],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
