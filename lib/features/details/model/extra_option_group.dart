import 'package:flutter_application_1/features/details/model/coffee_extra_model.dart';

enum OptionSelectionType { single, multiple }

class CoffeeOptionGroup {
  final String title;
  final OptionSelectionType selectionType;
  final List<ExtraOption> options;

  const CoffeeOptionGroup({
    required this.title,
    required this.selectionType,
    required this.options,
  });
}
