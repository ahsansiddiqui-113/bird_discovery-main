import 'package:bird_discovery/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirdSeeingDateScreen extends StatefulWidget {
  const BirdSeeingDateScreen({super.key});

  @override
  State<BirdSeeingDateScreen> createState() => _BirdSeeingDateScreenState();
}

class _BirdSeeingDateScreenState extends State<BirdSeeingDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: 248.h,
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          showDayOfWeek: false,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime value) {},
        ),
      ),
    );
  }
}
