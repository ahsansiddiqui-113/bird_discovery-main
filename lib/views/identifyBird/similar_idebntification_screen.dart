import 'package:bird_discovery/controllers/bird_identifier_controller.dart';
import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:bird_discovery/views/identifyBird/widgets/bird_item.dart';
import 'package:bird_discovery/views/identifyBird/widgets/chat_bubble.dart';
import 'package:bird_discovery/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';

class SimilarIdentificationScreen extends StatefulWidget {
  const SimilarIdentificationScreen({super.key});

  @override
  _SimilarIdentificationScreenState createState() =>
      _SimilarIdentificationScreenState();
}

class _SimilarIdentificationScreenState
    extends State<SimilarIdentificationScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final BirdIdentifierController ctrl = Get.put(BirdIdentifierController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 16.w), // Proper padding
          height: 48.h,
          child: CustomIconButton(
            onPressed: () => Get.back(),
            child: Image.asset(AppImages.arrowLeft, height: 16.h),
          ),
        ),
        // leading: IconButton(
        //   icon: Container(
        //     width: 48.w,
        //     height: 48.h,
        //     decoration: BoxDecoration(
        //       color: AppColors.lightGreyColor,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Icon(
        //       Icons.arrow_back_ios_new,
        //       size: 16.w,
        //       color: AppColors.blackColor,
        //     ),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        //   padding: EdgeInsets.only(left: 16.w), // Proper padding
        // ),
        title: Text(
          'Ask BirdBrain',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Container(
              // padding: EdgeInsets.only(left: 16.w), // Proper padding
              height: 48.h,
              child: CustomIconButton(
                // onPressed: () => Get.back(),
                child: Image.asset(AppImages.moreHorzIcon, width: 20.h),
              ),
            ),
            // child: IconButton(
            //   icon: Container(
            //     width: 40.w,
            //     height: 40.h,
            //     decoration: BoxDecoration(
            //       color: AppColors.lightGreyColor,
            //       shape: BoxShape.circle,
            //     ),
            //     child: Icon(
            //       Icons.more_vert, // More vertical dots often look better
            //       size: 20.w,
            //       color: AppColors.blackColor,
            //     ),
            //   ),
            //   onPressed: () {
            //     // Add your action here
            //   },
            //   padding: EdgeInsets.zero, // Remove default padding
            // ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            // Bird List Section
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: ListView.builder(
                  itemCount: ctrl.birdList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                        vertical: 6.h,
                      ),
                      child: BirdItem(
                        birdName: ctrl.birdList[index].name,
                        birdScientificName: ctrl.birdList[index].scientificName,
                        onTap: () {
                          // Handle Bird Details
                        },
                        imageUrl: ctrl.birdList[index].imageUrl,
                      ),
                    );
                  },
                ),
              ),
            ),
            // "Try Again"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: CustomButton(
                text: "Try Again",
                isGradient: false,
                textColor: AppColors.secondaryColor,
                fontSize: 16.sp,
                bgColor: AppColors.whiteColor,
                borderColor: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
                width: double.infinity,
                height: 54.h,
                onclick: () {},
              ),
            ),
            // Chat Section (only after user starts the conversation)
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: ListView.builder(
                  reverse: true, // Makes the list scroll to the bottom
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return ChatBubble(
                      message: message['text']!,
                      isSender: message['isSender'] == 'true',
                    );
                  },
                ),
              ),
            ),
            // Input field and Send button section with light blue background
            Container(
              height: 108.h,
              color: AppColors.mediumBlueColor,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
              child: Row(
                children: [
                  // Input field
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white, // White input field
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type message...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Send button with a blue circular background
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      // Send message logic
                      _sendMessage(_controller.text); // Send the message
                      _controller.clear(); // Clear input field after sending
                    },
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        gradient: AppColors.linearGradient,
                        // color:
                        //     AppColors
                        //         .primaryColor, // Blue color for send button
                        shape: BoxShape.circle,
                      ),
                      // child: Icon(Icons.send, size: 24.w, color: Colors.white),
                      child: Image.asset(
                        AppImages.sendIcon,
                        height: 17.h,
                        width: 17.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // Function to send a message
  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        // Add sender message (true means sender)
        _messages.insert(0, {'text': message, 'isSender': 'true'});

        // Simulate a reply (dummy reply for now)
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            // Add receiver's message (false means receiver)
            _messages.insert(0, {
              'text': 'This is a dummy reply...',
              'isSender': 'false',
            });
          });
        });
      });
    }
  }
}
