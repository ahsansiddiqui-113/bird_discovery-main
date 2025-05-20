import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StarsRow extends StatelessWidget {
  const StarsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: AppColors.goldenColor),
        Icon(Icons.star, color: AppColors.goldenColor),
        Icon(Icons.star, color: AppColors.goldenColor),
        Icon(Icons.star, color: AppColors.goldenColor),
        Icon(Icons.star, color: AppColors.goldenColor),
      ],
    );
  }
}
