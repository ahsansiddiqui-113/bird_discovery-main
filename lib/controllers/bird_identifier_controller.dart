import 'package:bird_discovery/utils/app_images.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BirdIdentifier {
  final String name;
  final String scientificName;
  final String imageUrl;

  BirdIdentifier({
    required this.imageUrl,
    required this.name,
    required this.scientificName,
  });
}

class BirdIdentifierController extends GetxController {
  var birdList = <BirdIdentifier>[].obs;
  var birdLisHotspot = <BirdIdentifier>[].obs;
  var isLoading = true.obs; // Add loading state
  var error = RxString(''); // Optional error state

  @override
  void onInit() {
    super.onInit();
    fetchBirdList();
  }

  // void fetchBirdList() {
  //   isLoading(true); // Start loading
  //   error(''); // Clear any previous errors

  //   // Simulate API Call
  //   Future.delayed(Duration(seconds: 2), () {
  //     try {
  //       birdList.value = [
  //         BirdIdentifier(
  //           name: 'Scarlet Robin',
  //           scientificName: 'Petroica boodang',
  //           imageUrl: AppImages.askBirdBrain1,
  //         ),
  //         BirdIdentifier(
  //           name: 'Rufous-tailed Scrub Robin',
  //           scientificName: 'Cercotrichas galactotes',
  //           imageUrl: AppImages.askBirdBrain2,
  //         ),
  //         BirdIdentifier(
  //           name: 'Rufous-backed Redstart',
  //           scientificName: 'Phoenicurus erythronotus',
  //           imageUrl: AppImages.askBirdBrain3,
  //         ),
  //         BirdIdentifier(
  //           name: 'Daurian Redstart',
  //           scientificName: 'Phoenicurus erythronotus',
  //           imageUrl: AppImages.askBirdBrain4,
  //         ),
  //         BirdIdentifier(
  //           name: 'Siberian Stonechat',
  //           scientificName: 'Saxicola maurus',
  //           imageUrl: AppImages.askBirdBrain5,
  //         ),
  //       ];
  //     } catch (e) {
  //       error('Failed to load birds'); // Set error message
  //     } finally {
  //       isLoading(false); // Stop loading regardless of success/failure
  //     }
  //   });
  // }

  void fetchBirdList() async {
    isLoading(true);
    error('');

    try {
      final response = await http.get(
        Uri.parse('http://192.168.10.4:8000/api/birds/list/'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        birdList.value =
            data.map((item) {
              return BirdIdentifier(
                name: item['name'] ?? 'Unknown',
                scientificName: item['scientific_name'] ?? 'N/A',
                imageUrl: item['image_url'] ?? '',
              );
            }).toList();
      } else {
        error('Failed to load birds');
      }
    } catch (e) {
      print('Error fetching birds: $e');
      error('Something went wrong');
    } finally {
      isLoading(false);
    }
  }

  void retryBirds() {
    fetchBirdList();
  }

  void sendChatReply(String reply) {
    // Handle chat reply logic
    print('Reply: $reply');
  }

  //biding hotspot bird list
  // Example bird data
  List<BirdIdentifier> birdListHotspot = [
    BirdIdentifier(
      name: 'Scarlet Robin',
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds5, // Path to image asset
    ),
    BirdIdentifier(
      name: "Philippine Coucal",
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds6, // Path to another image asset
    ),
    BirdIdentifier(
      name: "Pacific Swallow",
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds7, // Path to another image asset
    ),
    BirdIdentifier(
      name: "Brown Shrike",
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds1, // Path to another image asset
    ),
    BirdIdentifier(
      name: "Striated Grassbird",
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds2, // Path to another image asset
    ),
    BirdIdentifier(
      name: "Hammingbird",
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds3, // Path to another image asset
    ),
    BirdIdentifier(
      name: "Scarlet Robin",
      scientificName: "Petroica boodang",
      imageUrl: AppImages.likelyBirds2, // Path to another image asset
    ),
  ];
  // Add more birds as needed
}
