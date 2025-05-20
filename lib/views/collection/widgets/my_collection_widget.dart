// lib/views/collection/widgets/my_collection_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../controllers/collection_controller.dart';
import '../../../utils/app_colors.dart';
import 'collection_screen_collection_widget.dart';

class MyCollectionSection extends StatelessWidget {
  final VoidCallback onAddTap;
  const MyCollectionSection({required this.onAddTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.isRegistered<CollectionController>()
        ? Get.find<CollectionController>()
        : Get.put(CollectionController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + count
        Text(
          'My Collection (${ctrl.myCollections.length.toString().padLeft(2, '0')})',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.h),

        // Grid background container
        Container(
          //color: AppColors.lightGreyColor2,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor2,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: ctrl.myCollections.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              mainAxisExtent: 140.h,  // each tile is 140.h tall
            ),
            itemBuilder: (_, i) {
              if (i == 0) {
                // “Add Collection” tile
                return GestureDetector(
                  onTap: onAddTap,
                  child: DottedBorder(
                    color: AppColors.darkGreyColor,
                    strokeWidth: 1,
                    dashPattern: [6, 4],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.r),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                shape: BoxShape.circle,
                              ),
                                child: Icon(Icons.add, size: 32.w, color: AppColors.blackColor),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Add Collection',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }

              final bird = ctrl.myCollections[i - 1];
              return CollectionTypeGridItem(
                bird: bird,
                onTap: () => print('Open ${bird.title}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
