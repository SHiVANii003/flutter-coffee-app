import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/features/view-model/coffee_viewmodel.dart';
import 'package:flutter_application_1/features/view/widgets/coffee_card.dart';
import 'package:flutter_application_1/features/view/coffee_cart.dart';

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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 16),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 410),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                itemCount: vm.coffees.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 2 : 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isMobile ? 0.72 : 0.85,
                ),
                itemBuilder: (context, index) {
                  return CoffeeCard(coffee: vm.coffees[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
