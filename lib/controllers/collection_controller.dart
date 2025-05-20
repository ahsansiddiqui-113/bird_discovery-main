import 'package:get/get.dart';

import '../utils/app_images.dart';
import 'explore_controller.dart';

class RarityHighlightModel {
  final String label;
  final String description;
  final String grade;
  final bool isOverall;
  RarityHighlightModel({
    required this.label,
    required this.description,
    required this.grade,
    this.isOverall = false,
  });
}
class CollectionRecentActivityModel {
  final String title;
  final String dateAdded;
  final String grade;
  final String imageUrl;

  CollectionRecentActivityModel({
    required this.title,
    required this.dateAdded,
    required this.grade,
    required this.imageUrl,
  });
}



class CollectionController extends GetxController {
  /// Current rarity filter label
  final selectedRarity = 'Rarity'.obs;

  /// Pagination
  final currentPage = 1.obs;
  final totalPages = 20;

  /// Grid vs List toggle
  final isGridView = true.obs;


  final RxList<BirdModel> myCollections = <BirdModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    myCollections.assignAll([
      BirdModel(
        title: 'Hummingbirds',
        scientificName: 'Trochilidae spp.',
        imageUrl: AppImages.bird1,
        category: '…',
        foodType: '…',
        feederType: '…',
        rarityCategory: 'Rare',
        grade: 'S',
        dateAdded: '05-04-2025',
      ),
      BirdModel(
        title: 'Migratory Birds',
        scientificName: 'Various spp.',
        imageUrl: AppImages.bird2,
        category: '…',
        foodType: '…',
        feederType: '…',
        rarityCategory: 'Common',
        grade: 'A',
        dateAdded: '05-04-2025',
      ),
      BirdModel(
        title: 'Songbirds',
        scientificName: 'Passeriformes',
        imageUrl: AppImages.bird2,
        category: '…',
        foodType: '…',
        feederType: '…',
        rarityCategory: 'Common',
        grade: 'B',
        dateAdded: '05-04-2025',
      ),
    ]);
    recentActivities.assignAll([
      CollectionRecentActivityModel(
        title: 'Scarlet Robin',
        dateAdded: 'Jan 2025',
        grade: 'S',
        imageUrl: AppImages.bird3,
      ),
      CollectionRecentActivityModel(
        title: 'Hummingbirds',
        dateAdded: 'Mar 2025',
        grade: 'S',
        imageUrl: AppImages.bird1,
      ),
      CollectionRecentActivityModel(
        title: 'Blue Jay',
        dateAdded: 'Feb 2025',
        grade: 'A',
        imageUrl: AppImages.bird2,
      ),
    ]);
  }

  final sRarity = 1.obs;
  final aRarity = 4.obs;
  final bRarity = 14.obs;
  final cRarity = 8.obs;
  final collectionScore = 'Impressive!'.obs;
  final rarityIndex = 'Rising'.obs;

  void setRarity(String rarity) => selectedRarity.value = rarity;

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      currentPage.value = page;
    }
  }

  void toggleView(bool grid) => isGridView.value = grid;

  final List<RarityHighlightModel> rarityHighlights = [
    RarityHighlightModel(
      label: 'Regional Abundance:',
      description: 'Extremely rare visitor (<5 sightings annually)',
      grade: 'S',
    ),
    RarityHighlightModel(
      label: 'Conservation Status:',
      description: 'Endangered or threatened (IUCN Red List species)',
      grade: 'S',
    ),
    RarityHighlightModel(
      label: 'Seasonal Occurrence:',
      description: 'Out of normal seasonal range or migration pattern',
      grade: 'S',
    ),
  ];

  final RarityHighlightModel overallSignificance = RarityHighlightModel(
    label: 'Overall Significance:',
    description: 'Exceptional find with high scientific/conservation value',
    grade: 'S/A',
    isOverall: true,
  );

  final RxList<CollectionRecentActivityModel> recentActivities =
      <CollectionRecentActivityModel>[].obs;


}