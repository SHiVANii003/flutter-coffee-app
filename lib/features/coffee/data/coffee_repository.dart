import '../model/coffee_model.dart';

class CoffeeRepository {
  List<CoffeeItem> getCoffees() {
    return [
      CoffeeItem(
        name: 'Caramel Latte',
        description:
            'A velvety blend of rich espresso and steamed milk, infused with golden caramel syrup and topped with a light caramel drizzle. Smooth, comforting, and perfectly balanced for a sweet indulgence.',
        imageUrl:
            'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400',
        price: 180,
      ),
      CoffeeItem(
        name: 'Espresso Macchiato',
        description:
            'A bold and intense shot of premium espresso gently marked with a dollop of frothy milk. Strong, aromatic, and crafted for those who appreciate the pure depth of coffee.',
        imageUrl:
            'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400',
        price: 150,
      ),
      CoffeeItem(
        name: 'Vanilla Cappuccino',
        description:
            'Creamy steamed milk layered with rich espresso and finished with a silky foam top. Enhanced with subtle vanilla notes for a smooth, lightly sweet finish.',
        imageUrl:
            'https://images.unsplash.com/photo-1533776992670-a72f4c28235e?w=500',
        price: 170,
      ),
      CoffeeItem(
        name: 'Mocha Delight',
        description:
            'A luxurious fusion of dark chocolate and bold espresso blended with steamed milk. Finished with a hint of cocoa for a deep, indulgent coffee experience.',
        imageUrl:
            'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?w=400',
        price: 200,
      ),
      CoffeeItem(
        name: 'Hazelnut Mocha',
        description:
            'Nutty hazelnut essence combined with rich chocolate and freshly brewed espresso. A smooth, aromatic beverage with a warm and slightly sweet finish.',
        imageUrl:
            'https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?w=400',
        price: 210,
      ),
      CoffeeItem(
        name: 'Classic Americano',
        description:
            'Freshly pulled espresso diluted with hot water to create a smooth yet bold coffee. Clean, balanced, and perfect for those who love a pure coffee taste.',
        imageUrl:
            'https://images.unsplash.com/photo-1551030173-122aabc4489c?w=400',
        price: 140,
      ),
      CoffeeItem(
        name: 'Iced Coffee',
        description:
            'Freshly brewed coffee poured over ice and chilled to perfection. Crisp, refreshing, and energizing — ideal for warm days or a cool caffeine boost.',
        imageUrl:
            'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400',
        price: 160,
      ),
    ];
  }
}
