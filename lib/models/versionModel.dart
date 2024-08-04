class VersionModel {
  final num id;
  final String title;
  final String image;

  VersionModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
