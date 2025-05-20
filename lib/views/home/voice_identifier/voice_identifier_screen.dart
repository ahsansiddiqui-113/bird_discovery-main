import 'dart:ui' as ui;

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/voice_identifier_controller.dart';
import '../../../utils/app_images.dart';
import 'ai_analysis_screen.dart';

class BirdSoundScreen extends StatelessWidget {
  final BirdSoundController controller = Get.put(BirdSoundController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.isRecording.value
              ? 'Bird Voice Recording...'
              : 'Identify by Voice',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CustomIconButton(
            onPressed: () => Get.back(),
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        // Handle navigation after recording stops
        if (controller.shouldNavigateToAnalysis.value) {
          controller.shouldNavigateToAnalysis.value = false;
          Future.delayed(const Duration(seconds: 2), () {
            Get.to(() => const AiAnalysisScreen());
          });
        }
        return Center(
          // Centering the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (controller.isRecording.value)
                _buildLiveWaveform(), // This shows live waveform while recording
              if (controller.recordedFilePath.value.isNotEmpty &&
                  !controller.isRecording.value)
                _buildRecordedWaveform(), // This shows recorded waveform after stopping recording

              SizedBox(height: 20.h),

              // Timer display (same as before)
              Container(
                padding: EdgeInsets.all(
                  9.0,
                ), // Add padding for spacing around the text
                decoration: BoxDecoration(
                  color:
                      controller.isRecording.value
                          ? AppColors.primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Text(
                  controller.timer.value,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    color:
                        controller.isRecording.value
                            ? AppColors.whiteColor
                            : AppColors.blackColor, // White text when recording
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Option Buttons (same as before)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween, // Center buttons horizontally
                  children: [
                    _buildOptionButton('Bird photo AI Enhance'),
                    _buildOptionButton('By Photo'),
                    _buildOptionButton('By Sound'),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ), // Adding space between the option buttons and the record button
              // Record Button and Instructions (same as before)
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (controller.isRecording.value) {
                        await controller.stopRecording();
                      } else {
                        await controller.startRecording();
                      }
                    },
                    child: Image.asset(
                      controller.isRecording.value
                          ? AppImages.stopImage
                          : AppImages.startImage,
                      width: 70.w,
                      height: 70.h,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Tap to start recording the bird’s sound',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        );
      }),
    );
  }

  // Live waveform display while recording
  Widget _buildLiveWaveform() {
    return Container(
      height: 120.h,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: AudioWaveforms(
        enableGesture: false,
        recorderController: controller.recorderController,
        size: Size(MediaQuery.of(Get.context!).size.width, 120.h),
        waveStyle: WaveStyle(
          showMiddleLine: false,
          waveColor: AppColors.primaryColor,
          extendWaveform: true,
          waveThickness: 4,
          spacing: 6,
          showBottom: false,
          showTop: false,
        ),
      ),
    );
  }

  // Recorded waveform display after recording stops
  Widget _buildRecordedWaveform() {
    return Container(
      height: 120.h,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: AudioWaveforms(
        recorderController: controller.recorderController,
        size: Size(MediaQuery.of(Get.context!).size.width, 120.h),
        waveStyle: WaveStyle(
          showMiddleLine: false,
          waveColor: Colors.blue,
          extendWaveform: true,
          waveThickness: 4,
          spacing: 6,
          showBottom: false,
          showTop: false,
          gradient: ui.Gradient.linear(
            const Offset(0, 0),
            const Offset(0, 50),
            [Colors.blue.withOpacity(0.8), Colors.blue],
          ),
        ),
      ),
    );
  }

  // Option button for other selections (same as before)
  Widget _buildOptionButton(String text) {
    return Obx(() {
      final isSelected = controller.selectedOption.value == text;
      return GestureDetector(
        onTap: () {
          if (!isSelected) {
            controller.navigateBasedOnOption(text);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            if (isSelected)
              Container(
                height: 2.h,
                width: text.length * 5.w,
                color: Colors.blue,
              ),
          ],
        ),
      );
    });
  }
}
