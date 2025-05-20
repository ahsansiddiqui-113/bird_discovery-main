//All helper functions in one file
import 'package:flutter/material.dart';


import 'app_colors.dart';
//Helper function to determine gradicent color:
Gradient getGradientColor(String grade) {
  switch (grade) {
    case 'A':
      return AppColors.aGradeGradient;
    case 'B':
      return AppColors.bGradeGradient;
    case 'C':
      return AppColors.cGradeGradient;
    default:
      return AppColors.sGradeGradient;
  }
}