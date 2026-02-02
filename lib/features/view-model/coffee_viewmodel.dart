import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/model/coffee_model.dart';

class CoffeeViewModel extends ChangeNotifier {
  final String title = 'Brewed Bliss';
  final String subtitle = 'Every sip tells a story';

  final List<CoffeeItem> coffees = [
    CoffeeItem(
      name: 'Caramel Latte',
      description: 'Smooth espresso kissed with caramel warmth.',
      imageUrl:
          'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400',
      price: 180,
    ),
    CoffeeItem(
      name: 'Espresso Macchiato',
      description: 'Bold espresso with a touch of foam.',
      imageUrl:
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400',
      price: 150,
    ),
    CoffeeItem(
      name: 'Vanilla Cappuccino',
      description: 'Creamy delight with a hint of vanilla.',
      imageUrl:
          'https://images.unsplash.com/photo-1533776992670-a72f4c28235e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29mZmVlJTIwY3VwfGVufDB8fDB8fHww?w=400',
      price: 170,
    ),
    CoffeeItem(
      name: 'Mocha Delight',
      description: 'Rich chocolate blended with espresso.',
      imageUrl:
          'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?w=400',
      price: 200,
    ),
    CoffeeItem(
      name: 'Hazelnut Mocha',
      description: 'Nutty hazelnut meets rich chocolate espresso.',
      imageUrl:
          'https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?w=400',
      price: 210,
    ),
    CoffeeItem(
      name: 'Classic Americano',
      description: 'Pure espresso diluted to smooth perfection.',
      imageUrl:
          'https://images.unsplash.com/photo-1551030173-122aabc4489c?w=400',
      price: 140,
    ),
    CoffeeItem(
      name: 'Iced Coffee',
      description: 'Chilled coffee served over ice for a bold refresh.',
      imageUrl:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400',
      price: 160,
    ),
  ];

  void onMenuPressed() {
    debugPrint('Hamburger menu pressed');
  }
}
