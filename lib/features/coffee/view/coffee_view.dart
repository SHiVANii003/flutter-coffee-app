import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/view/cart_view.dart';
import 'package:flutter_application_1/features/coffee/view-model/coffee_viewmodel.dart';
import 'package:flutter_application_1/features/details/view/coffee_details_view.dart';
import 'package:flutter_application_1/features/coffee/widgets/coffee_card.dart';
import 'package:provider/provider.dart';

import '../../../../core/responsive/responsive_builder.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CoffeeViewModel>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              vm.title,
              style: TextStyle(
                color: colors.surface,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              vm.subtitle,
              style: TextStyle(color: colors.surface, fontSize: 12),
            ),
          ],
        ),
        actions: [
          // 🛒 CART ICON WITH BADGE
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              if (vm.cartItemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${vm.cartItemCount}',
                      style: TextStyle(
                        color: colors.onPrimary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: ResponsiveBuilder(
        builder: (context, config) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: config.maxWidth),
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: vm.coffees.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: config.columns,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: config.aspectRatio,
                ),
                itemBuilder: (context, index) {
                  final coffee = vm.coffees[index];

                  return CoffeeCard(
                    coffee: coffee,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CoffeeDetailsScreen(coffee: coffee),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
