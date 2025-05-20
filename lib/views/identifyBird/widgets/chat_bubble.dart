import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const ChatBubble({Key? key, required this.message, required this.isSender})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSender) ...[
              // Receiver's Avatar outside the container, placed on the left
              CircleAvatar(
                radius: 15.w,
                backgroundImage: AssetImage('assets/images/bird_image.jpg'),
              ),
              SizedBox(width: 8.w),
            ],
            // Message Container (only for receiver's message)
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSender ? AppColors.primaryColor : Colors.grey[300],
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isSender ? Colors.white : Colors.black,
                    fontSize: 14.sp,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
