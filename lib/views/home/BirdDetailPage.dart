import 'package:bird_discovery/views/home/bird.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BirdDetailPage extends StatefulWidget {
  final int birdId;

  BirdDetailPage({required this.birdId});

  @override
  _BirdDetailPageState createState() => _BirdDetailPageState();
}

class _BirdDetailPageState extends State<BirdDetailPage> {
  Bird? bird;

  @override
  void initState() {
    super.initState();
    fetchBirdDetail();
  }

  Future<void> fetchBirdDetail() async {
    final response = await http.get(
      Uri.parse(
        'http://<your-server-ip>:8000/api/bird/details/${widget.birdId}/',
      ),
    );

    if (response.statusCode == 200) {
      setState(() {
        bird = Bird.fromJson(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load bird details');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bird == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(bird!.name)),
      body: Column(
        children: [
          Image.network(bird!.imageUrl),
          Text(bird!.scientificName),
          // Add more detail fields here if needed
        ],
      ),
    );
  }
}
