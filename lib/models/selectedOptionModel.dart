import 'package:truetech/models/optionModel.dart';

class SelectedOptionModel {
  final OptionModel option;
  final num quantity;

  SelectedOptionModel({
    required this.option,
    required this.quantity,
  });

  SelectedOptionModel copyWith({num? quantity}) {
    return SelectedOptionModel(
      option: this.option,
      quantity: quantity ?? this.quantity,
    );
  }

  factory SelectedOptionModel.fromJson(Map<String, dynamic> json) {
    return SelectedOptionModel(
      option: json['option'] ??
          OptionModel(
            id: 0,
            title: '',
            model: '',
            type: '',
            prix: 0,
            image: '',
          ),
      quantity: json['quantity'] ?? 0,
    );
  }
}
