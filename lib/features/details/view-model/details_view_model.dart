import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/details/model/extra_option_group.dart';
import '../data/coffee_details_repository.dart';

class CoffeeDetailsViewModel extends ChangeNotifier {
  final CoffeeDetailsRepository _repository;

  CoffeeDetailsViewModel(this._repository);

  final Map<String, List<int>> _selectedOptions = {};

  List<CoffeeOptionGroup> get optionGroups => _repository.getOptionGroups();

  Map<String, List<int>> get selectedOptions => _selectedOptions;

  void selectOption({
    required String groupTitle,
    required int index,
    required OptionSelectionType type,
  }) {
    if (type == OptionSelectionType.single) {
      _selectedOptions[groupTitle] = [index];
    } else {
      final current = _selectedOptions[groupTitle] ?? [];
      if (current.contains(index)) {
        current.remove(index);
      } else {
        current.add(index);
      }
      _selectedOptions[groupTitle] = current;
    }

    notifyListeners();
  }

  int calculateTotalPrice(int basePrice) {
    int total = basePrice;

    for (final group in optionGroups) {
      final selectedIndexes = _selectedOptions[group.title] ?? [];

      for (final i in selectedIndexes) {
        total += group.options[i].price;
      }
    }

    return total;
  }
}
