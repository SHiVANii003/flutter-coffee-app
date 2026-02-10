import 'package:flutter/material.dart';
import '../model/coffee_model.dart';
import '../data/coffee_repository.dart';

class CoffeeViewModel extends ChangeNotifier {
  final CoffeeRepository _repository;

  CoffeeViewModel(this._repository);

  final String title = 'Brewed Bliss';
  final String subtitle = 'Every sip tells a story';

  List<CoffeeItem> coffees = [];

  // UI STATE
  int _cartItemCount = 0;
  int get cartItemCount => _cartItemCount;

  void loadCoffees() {
    coffees = _repository.getCoffees();
    notifyListeners();
  }

  // TEMP UI helpers
  void incrementCartCount() {
    _cartItemCount++;
    notifyListeners();
  }

  void resetCartCount() {
    _cartItemCount = 0;
    notifyListeners();
  }
}
