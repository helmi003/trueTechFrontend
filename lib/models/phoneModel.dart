class PhoneModel {
  final num id;
  final String title;
  final String image;

  PhoneModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
