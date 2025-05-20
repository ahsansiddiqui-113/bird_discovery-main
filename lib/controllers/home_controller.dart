import 'package:get/get.dart';

import '../utils/app_images.dart';
import 'explore_controller.dart';

class RecentActivityModel {
  final String title;
  final String dateAdded;
  final String grade;
  final String imageUrl;

  RecentActivityModel({
    required this.title,
    required this.dateAdded,
    required this.grade,
    required this.imageUrl,
  });
}

class HomeController extends GetxController {
  //for birding hotspot screen
  final RxBool showLocationDialog = true.obs;

  final sRarity = 1.obs;
  final aRarity = 4.obs;
  final bRarity = 14.obs;
  final cRarity = 8.obs;
  final collectionScore = 'Impressive!'.obs;
  final rarityIndex = 'Rising'.obs;

  // Bragging Rights
  final topFindPercent = 'Top 5% Find'.obs;
  final collectionRank = 'Top 5%'.obs;
  final locationCount = '12 Explored'.obs;
  final streakStatus = '14 Days Active'.obs;

  // Alert
  final alertTitle = 'S-Rarity Bird Sighting Alert!'.obs;
  final alertMessage = 'Peregrine Falcon spotted 2 miles away'.obs;

  final List<CategoryModel> nearbyBirds = [
    CategoryModel(title: 'Hummingbirds', imageUrl: AppImages.bird4),
    CategoryModel(title: 'Songbirds', imageUrl: AppImages.bird5),
    CategoryModel(title: 'Migratory Birds', imageUrl: AppImages.bird1),
    CategoryModel(title: 'Waterfowl', imageUrl: AppImages.bird2),
    CategoryModel(title: 'Birds of Prey', imageUrl: AppImages.bird3),
  ];

  /// Recent Activity
  final List<RecentActivityModel> recentActivities = [
    RecentActivityModel(
      title: 'Scarlet Robin',
      dateAdded: 'Jan 2025',
      grade: 'S',
      imageUrl: AppImages.bird1,
    ),
    RecentActivityModel(
      title: 'Hummingbirds',
      dateAdded: 'Mar 2025',
      grade: 'B',
      imageUrl: AppImages.bird2,
    ),
    RecentActivityModel(
      title: 'Songbirds',
      dateAdded: 'Apr 2025',
      grade: 'A',
      imageUrl: AppImages.bird3,
    ),
    RecentActivityModel(
      title: 'Migratory Birds',
      dateAdded: 'May 2025',
      grade: 'C',
      imageUrl: AppImages.bird5,
    ),
    RecentActivityModel(
      title: 'Waterfowl',
      dateAdded: 'Jun 2025',
      grade: 'S',
      imageUrl: AppImages.bird4,
    ),
    RecentActivityModel(
      title: 'Birds of Prey',
      dateAdded: 'Jul 2025',
      grade: 'A',
      imageUrl: AppImages.bird2,
    ),
    RecentActivityModel(
      title: 'Scarlet Robin',
      dateAdded: 'Aug 2025',
      grade: 'B',
      imageUrl: AppImages.bird3,
    ),
  ];
}
