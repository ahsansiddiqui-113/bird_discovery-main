import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BirdApiService {
  static Future<String?> enhanceImage(File imageFile) async {
    final uri = Uri.parse('http://192.168.10.4:8000/api/birds/enhance/');

    var request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path),
    );

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final data = jsonDecode(responseBody);
        return data['enhanced_image_url'];
      } else {
        print("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Request Error: $e");
    }
    return null;
  }
}
