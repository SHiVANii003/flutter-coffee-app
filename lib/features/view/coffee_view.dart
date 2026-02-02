import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/view-model/coffee_viewmodel.dart';
import 'package:flutter_application_1/features/view/coffee_cart.dart';
import 'package:flutter_application_1/features/view/widgets/coffee_card.dart';
import 'package:provider/provider.dart';

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
            Text(
              vm.subtitle,
              style: TextStyle(color: colors.surface, fontSize: 12),
            ),
          ],
        ),

        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            ),
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: vm.coffees.length,
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return CoffeeCard(coffee: vm.coffees[index]);
        },
      ),
    );
  }
}
