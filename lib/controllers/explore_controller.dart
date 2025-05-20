import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/app_images.dart';

class ExploreModel {
  final String title;
  final String description;

  ExploreModel({required this.title, required this.description});
}

class CategoryModel {
  final String title;
  final String imageUrl;

  CategoryModel({required this.title, required this.imageUrl});
}

class BirdModel {
  final String title;
  final String scientificName;
  final String imageUrl;
  final String category;
  final String foodType;
  final String feederType;
  final String rarityCategory;
  final String grade;
  final String? dateAdded;

  BirdModel({
    required this.title,
    required this.scientificName,
    required this.imageUrl,
    required this.category,
    required this.foodType,
    required this.feederType,
    required this.rarityCategory,
    required this.grade,
    this.dateAdded,
  });
}

class ExploreController extends GetxController {
  final _data =
      ExploreModel(
        title:
            'Bird Families, Species, and Habitats. Learn about the different types of birds you can find in your area.',
        description:
            'Discover local species by snapping a photo of a bird or searching by name or family. This app is designed to help you identify birds in your area and learn more about them. As you explore, you can save your favorite birds and share your findings with friends. Whether you are a beginner or an experienced birdwatcher, this app is for you.',
      ).obs;

  final List<CategoryModel> allCategories = [
    CategoryModel(title: 'Common Landbirds', imageUrl: AppImages.commonbird1),
    CategoryModel(title: 'Common Waders', imageUrl: AppImages.commonbird2),
    CategoryModel(title: 'Common Natators', imageUrl: AppImages.commonbird3),
    CategoryModel(title: 'Common Songbirds', imageUrl: AppImages.commonbird4),
    CategoryModel(title: 'Common Raptors', imageUrl: AppImages.commonbird5),
    CategoryModel(
      title: 'Common Colorful Birds',
      imageUrl: AppImages.commonbird6,
    ),
  ];
  final RxList<CategoryModel> filteredCategories = <CategoryModel>[].obs;

  final Rx<CategoryModel?> selectedCategory = Rx<CategoryModel?>(null);

  final List<BirdModel> allBirds = [
    BirdModel(
      title: 'American bush-tit',
      scientificName: 'Psaltriparus minimus',
      imageUrl: AppImages.commonbird6,
      category: 'Common Landbirds',
      foodType: 'All',
      feederType: 'All',
      rarityCategory: 'Common',
      grade: "A",
    ),
    BirdModel(
      title: 'American crow',
      scientificName: 'Corvus brachythryrhynchos',
      imageUrl: AppImages.commonbird7,
      category: 'Common Landbirds',
      foodType: 'All',
      feederType: 'All',
      rarityCategory: 'Common',
      grade: "A",
    ),
    BirdModel(
      title: 'American goldfinch',
      scientificName: 'Spinus tristis',
      imageUrl: AppImages.commonbird8,
      category: 'Common Landbirds',
      foodType: 'All',
      feederType: 'All',
      rarityCategory: 'Common',
      grade: "A",
    ),
    BirdModel(
      title: 'American robin',
      scientificName: 'Turdus migratorius',
      imageUrl: AppImages.commonbird9,
      category: 'Common Landbirds',
      foodType: 'All',
      feederType: 'All',
      rarityCategory: 'Common',
      grade: "A",
    ),
    BirdModel(
      title: 'American raptors',
      scientificName: 'Accipitridae spp.',
      imageUrl: AppImages.commonbird10,
      category: 'Common Landbirds',
      foodType: 'All',
      feederType: 'All',
      rarityCategory: 'Common',
      grade: "A",
    ),
    BirdModel(
      title: 'American colorful birds',
      scientificName: 'Various spp.',
      imageUrl: AppImages.commonbird1,
      category: 'Common Landbirds',
      foodType: 'All',
      feederType: 'All',
      rarityCategory: 'Common',
      grade: "A",
    ),
  ];
  final RxList<BirdModel> filteredBirds = <BirdModel>[].obs;

  final List<String> foodOptions = ['All', 'Seeds', 'Fruits', 'Insects'];
  final List<String> foodImages = [
    AppImages.allCategory,
    AppImages.food1,
    AppImages.food2,
    AppImages.food3,
  ];
  // final List<String> foodOptions = ['All', 'Seeds', 'Fruits', 'Insects'];
  final List<String> feederOptions = ['All', 'Ground', 'Hanging'];
  final List<String> feederImages = [
    AppImages.allCategory,
    AppImages.feeder1,
    AppImages.feeder2,
  ];
  final RxString selectedFood = 'All'.obs;
  final RxString selectedFeeder = 'All'.obs;

  @override
  void onInit() {
    filteredCategories.assignAll(allCategories);
    super.onInit();
  }

  void selectCategory(CategoryModel cat) {
    selectedCategory.value = cat;
    // initialize birds for this category
    filteredBirds.assignAll(
      allBirds.where((b) => b.category == cat.title).toList(),
    );
  }

  void setFood(String f) {
    selectedFood.value = f;
    _applyBirdFilters();
  }

  void setFeeder(String f) {
    selectedFeeder.value = f;
    _applyBirdFilters();
  }

  void _applyBirdFilters() {
    var list = allBirds.where(
      (b) => b.category == selectedCategory.value?.title,
    );
    if (selectedFood.value != 'All')
      list = list.where((b) => b.foodType == selectedFood.value);
    if (selectedFeeder.value != 'All')
      list = list.where((b) => b.feederType == selectedFeeder.value);
    filteredBirds.assignAll(list.toList());
  }

  int get birdCount => filteredBirds.length;

  void onSearch(String query) {
    if (query.isEmpty) {
      filteredCategories.assignAll(allCategories);
    } else {
      filteredCategories.assignAll(
        allCategories
            .where((c) => c.title.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  String get title => _data.value.title;
  String get description => _data.value.description;
}
