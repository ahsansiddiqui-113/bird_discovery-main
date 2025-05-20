class Bird {
  final int id;
  final String name;
  final String scientificName;
  final String imageUrl;

  Bird({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.imageUrl,
  });

  factory Bird.fromJson(Map<String, dynamic> json) {
    return Bird(
      id: json['id'],
      name: json['name'],
      scientificName: json['scientific_name'],
      imageUrl: json['image_url'],
    );
  }
}
