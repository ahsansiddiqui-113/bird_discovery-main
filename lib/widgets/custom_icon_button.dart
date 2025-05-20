import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  const CustomIconButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onPressed ?? () {},
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: AppColors.lightGreyColor,
        child: child,
      ),
    );
  }
}
