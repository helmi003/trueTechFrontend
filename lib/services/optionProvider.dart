import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:truetech/models/selectedOptionModel.dart';

class OptionProvider with ChangeNotifier {
  final url = dotenv.env['API_URL'];
  List<SelectedOptionModel> selectedOptions = [];

  addToCart(List<SelectedOptionModel> addedOptions) {
    selectedOptions = addedOptions;
    notifyListeners();
  }
}
