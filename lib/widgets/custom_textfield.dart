import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final double? height;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixIconTap;
  final ValueChanged<String>? onChanged;
  final bool? obsecureText;
  final String? suffixIcon;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  const CustomTextfield({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.height,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconTap,
    this.onChanged,
    this.obsecureText,
    this.suffixIcon,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.hintColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 66.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
      ),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        obscureText: obsecureText ?? false,
        onChanged: onChanged,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          filled: false,
          hintText: hintText ?? '',
          labelText: labelText ?? '',
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: labelColor ?? AppColors.hintColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: TextStyle(
            color: hintColor ?? AppColors.hintColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          suffixIconConstraints: BoxConstraints(
            minHeight: 16.5.h,
            minWidth: 16.5.w,
          ),
          suffixIcon:
              suffixIcon == null
                  ? null
                  : InkWell(
                    onTap: onSuffixIconTap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 5.0.h,
                      ),
                      child: Image.asset(suffixIcon ?? '', height: 16.w),
                    ),
                  ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 17.h,
            horizontal: 16.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.greyColor,
              width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: borderColor ?? AppColors.primaryColor,
              width: 1.w,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
