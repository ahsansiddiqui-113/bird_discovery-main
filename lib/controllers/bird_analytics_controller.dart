// lib/controllers/bird_analytics_controller.dart

import 'package:get/get.dart';
import '../utils/app_images.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BirdAnalyticsModel {
  final String scientificName;
  final String confidence;
  final String dateText;
  final String location;
  final bool safeForPlants;
  final bool nonToxic;

  BirdAnalyticsModel({
    required this.scientificName,
    required this.confidence,
    required this.dateText,
    required this.location,
    required this.safeForPlants,
    required this.nonToxic,
  });
}

class BirdAnalyticsController extends GetxController {
  /// PageView images
  final RxList<String> pageImages =
      <String>[AppImages.bird1, AppImages.bird2, AppImages.bird3].obs;

  Future<void> fetchBirdAnalytics(int birdId) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.10.4:8000/api/analytics/$birdId/'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        birdDetails.value = BirdAnalyticsModel(
          scientificName: data['scientific_name'],
          confidence: data['confidence'],
          dateText: data['date_text'],
          location: data['location'],
          safeForPlants: data['safe_for_plants'],
          nonToxic: data['non_toxic'],
        );
      }
    } catch (e) {
      print('Error fetching analytics: $e');
    }
  }

  /// Albums strip images
  final RxList<String> albumImages =
      <String>[
        AppImages.bird1,
        AppImages.bird2,
        AppImages.bird3,
        AppImages.bird1,
        AppImages.bird2,
        AppImages.bird3,
      ].obs;

  /// The details block
  final Rx<BirdAnalyticsModel> birdDetails =
      BirdAnalyticsModel(
        scientificName: 'Sialia mexicana',
        confidence: '92%',
        dateText: 'Today, 2:24 pm',
        location: 'Backyard',
        safeForPlants: true,
        nonToxic: true,
      ).obs;
}
