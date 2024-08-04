class OptionModel {
  final num id;
  final String title;
  final String model;
  final String type;
  final num prix;
  final String image;

  OptionModel( {
    required this.id,
    required this.title,
    required this.model,
    required this.type,
    required this.prix,
    required this.image,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      model: json['model'] ?? '',
      type: json['type'] ?? '',
      prix: json['prix'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
