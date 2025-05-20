import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final bool isGradient;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? radius;
  final double? width;
  final double? height;
  final VoidCallback? onclick;

  const CustomButton({
    super.key,
    this.text,
    required this.isGradient,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.radius,
    this.width,
    this.height,
    this.onclick,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick ?? () => print('Tapped'),
      child: Container(
        height: height ?? 52.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          gradient: isGradient ? AppColors.linearGradient : null,
          color: isGradient ? null : bgColor ?? AppColors.primaryColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 16.0.r),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: textColor ?? AppColors.whiteColor,
              fontSize: fontSize ?? 16.sp,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
