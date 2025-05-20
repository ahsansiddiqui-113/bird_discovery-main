import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileWidget extends StatelessWidget {
  final Widget? leading;
  // final Widget? trailing;
  final bool hasTrailing;
  final Widget? child;
  final double? width;
  final double? height;
  final VoidCallback? ontap;
  // final Color? borderColor;

  const ListTileWidget({
    super.key,
    this.leading,
    // this.trailing,
    required this.hasTrailing,
    this.child,
    this.width,
    this.height,
    this.ontap,
    // this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: height ?? 60.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 17.w),
            child: Row(
              children: [
                leading ?? SizedBox.shrink(),
                SizedBox(width: 4.w),
                child ?? SizedBox.shrink(),
                Spacer(),
                hasTrailing
                    ? SizedBox(
                      height: 10.h,
                      width: 10.w,
                      child: Checkbox(value: false, onChanged: (value) {}),
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
