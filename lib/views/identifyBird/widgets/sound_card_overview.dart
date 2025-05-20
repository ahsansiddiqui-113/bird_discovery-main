import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/sound_controlleer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class SoundSection extends StatelessWidget {
  const SoundSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(SoundController());

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Row(
            children: [
              Image.asset(
                AppImages.waveIcon,
                width: 20.w,
                height: 20.w,
                color: AppColors.blackColor,
              ),
              SizedBox(width: 8.w),
              Text(
                'Sound',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // inner grey box
          Container(
            decoration: BoxDecoration(
              color: AppColors.searchBarColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Song',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Image.asset(
                      AppImages.questionIcon,
                      width: 15.w,
                      height: 15.w,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => Column(
                    children: List.generate(ctrl.paths.length, (i) {
                      final isPlaying = ctrl.playingIndex.value == i;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: GestureDetector(
                          onTap: () => ctrl.toggle(i),
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              children: [
                                Container(
                                  width: 28.w,             // make it a perfect square
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    gradient: isPlaying
                                        ? AppColors.linearGradient2
                                        : LinearGradient(
                                      colors: [
                                        AppColors.primaryColor,
                                        AppColors.secondaryColor,
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      isPlaying ? Icons.pause : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 18.w,          // a bit smaller than the container
                                    ),
                                  ),
                                ),

                                SizedBox(width: 8.w),
                                // waveform
                                Expanded(
                                  child: AudioFileWaveforms(
                                    size: Size(double.infinity, 24.h),
                                    playerController: ctrl.waveControllers[i],
                                    waveformType: WaveformType.long,
                                    waveformData: ctrl.waveControllers[i].waveformData, // pre-extracted
                                    enableSeekGesture: true,

                                  ),
                                ),
                                SizedBox(width: 8.w),
                                // duration (static for now)
                                Text(
                                  '01:44',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
