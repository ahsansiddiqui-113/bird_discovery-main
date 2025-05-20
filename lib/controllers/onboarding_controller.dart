import 'package:bird_discovery/utils/app_images.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;

  final List<Map<String, String>> onBoardingData = [
    {
      'image': AppImages.onboarding1, //Your image assets
      'title': 'Identify All Kind Of Birds Using Camera & Sounds',
      'subtitle': 'Identify 10+ birds',
    },
    {
      'image': AppImages.onboarding2,
      'title': 'Explore Birds and Hotspots Around You',
      'subtitle':
          'Discover which birds are near you and where you can see them By Nearly Hotspots.',
    },
    {
      'image': AppImages.onboarding3,
      'title': 'Find Your Birds Like Never Before',
      'subtitle':
          'Turn your passion into recognition with Bird Identifier that command respect.',
    },
  ];
}
