import 'package:bird_discovery/utils/app_colors.dart';
import 'package:bird_discovery/utils/app_images.dart';
import 'package:get/get.dart';

class IdentifyBirdController extends GetxController {
  RxInt pageNo = 1.obs;

  RxDouble get indicatorBar {
    switch (pageNo.value) {
      case 1:
        return 0.1.obs;
      case 2:
        return 0.3.obs;
      case 3:
        return 0.5.obs;
      case 4:
        return 0.7.obs;
      case 5:
        return 0.9.obs;
      default:
        return 0.1.obs;
    }
  }

  List<String> questionList = [
    'What size was the bird?',
    'What were the main color?',
    'Was the Bird?',
    'When did you see the bird?',
    'Where did you see the bird?',
  ];

  List<Map<String, String>> birdSizeList = [
    {
      'image': AppImages.tinyBird,
      'size': 'Tiny',
      'measurement': '3-5 inches / 7.5-13 cm',
    },
    {
      'image': AppImages.smallBird,
      'size': 'Small',
      'measurement': '5-7 inches / 13-18 cm',
    },
    {
      'image': AppImages.mediumBird,
      'size': 'Medium',
      'measurement': '7-10 inches / 18-25 cm',
    },
    {
      'image': AppImages.largeBird,
      'size': 'Large',
      'measurement': '10-16 inches / 25-40 cm',
    },
    {
      'image': AppImages.veryLargeBird,
      'size': 'Very Large',
      'measurement': '16+ inches / 40+ cm',
    },
  ];

  List<Map<String, dynamic>> birdColorList = [
    {'colorName': 'Black', 'color': AppColors.blackColor},
    {'colorName': 'Gray', 'color': AppColors.birdGrey},
    {'colorName': 'Buff/Brown', 'color': AppColors.birdBrown},
    {'colorName': 'Red/Rufous', 'color': AppColors.birdRed},
    {'colorName': 'Yellow', 'color': AppColors.birdYellow},
    {'colorName': 'White', 'color': AppColors.whiteColor},
    {'colorName': 'Olive/Green', 'color': AppColors.birdOlive},
    {'colorName': 'Blue', 'color': AppColors.birdBlue},
    {'colorName': 'Orange', 'color': AppColors.birdOrange},
    {'colorName': 'Purple', 'color': AppColors.birdPurple},
  ];

  List<String> birdActivityList = [
    'Eating at a feeder',
    'Swimming or wading',
    'On the ground',
    'In trees or bushes',
    'On a fence or wire',
    'Soaring or flying',
  ];

  List<Map<String, String>> locationSearches = [
    {'city': 'Town Hall', 'location': 'Hong Kong'},
    {'city': 'Park Valley', 'location': 'Hong Kong'},
    {'city': 'Town Hall', 'location': 'Hong Kong'},
    {'city': 'Park Valley', 'location': 'Hong Kong'},
    {'city': 'Town Hall', 'location': 'Hong Kong'},
    {'city': 'Park Valley', 'location': 'Hong Kong'},
  ];
}
