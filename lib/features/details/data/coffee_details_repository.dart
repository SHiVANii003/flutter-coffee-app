import 'package:flutter_application_1/features/details/model/coffee_extra_model.dart';
import 'package:flutter_application_1/features/details/model/extra_option_group.dart';

class CoffeeDetailsRepository {
  List<CoffeeOptionGroup> getOptionGroups() {
    return const [
      CoffeeOptionGroup(
        title: "Extras",
        selectionType: OptionSelectionType.single,
        options: [
          ExtraOption(title: "Spicy", price: 10),
          ExtraOption(title: "Caramel Drizzle", price: 15),
          ExtraOption(title: "Chocolate Syrup", price: 20),
        ],
      ),
      CoffeeOptionGroup(
        title: "Milk Type",
        selectionType: OptionSelectionType.single,
        options: [
          ExtraOption(title: "Regular Milk", price: 0),
          ExtraOption(title: "Almond Milk", price: 20),
          ExtraOption(title: "Oat Milk", price: 25),
        ],
      ),
      CoffeeOptionGroup(
        title: "Sugar Level",
        selectionType: OptionSelectionType.single,
        options: [
          ExtraOption(title: "No Sugar", price: 0),
          ExtraOption(title: "Less Sugar", price: 0),
          ExtraOption(title: "Normal Sugar", price: 0),
        ],
      ),
    ];
  }
}
