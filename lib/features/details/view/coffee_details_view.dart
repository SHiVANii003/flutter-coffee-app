import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/details/view-model/details_view_model.dart';
import 'package:flutter_application_1/features/details/widgets/coffee_extras_section.dart';
import 'package:provider/provider.dart';
import '../../coffee/model/coffee_model.dart';
import '../data/coffee_details_repository.dart';
import '../widgets/details_info_block.dart';
import '../widgets/floating_icon_button.dart';
import '../../coffee/widgets/like_button.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  final CoffeeItem coffee;

  const CoffeeDetailsScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoffeeDetailsViewModel(CoffeeDetailsRepository()),
      child: _CoffeeDetailsView(coffee: coffee),
    );
  }
}

class _CoffeeDetailsView extends StatelessWidget {
  final CoffeeItem coffee;

  const _CoffeeDetailsView({required this.coffee});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CoffeeDetailsViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                  child: Image.network(
                    coffee.imageUrl,
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 20,
                  child: FloatingIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const Positioned(bottom: 20, right: 20, child: LikeButton()),
              ],
            ),

            const SizedBox(height: 14),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(10),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(coffee.description),
                  const SizedBox(height: 24),

                  DetailsInfoBlock(price: vm.calculateTotalPrice(coffee.price)),

                  const SizedBox(height: 28),

                  ...vm.optionGroups
                      .map((group) => OptionGroupWidget(group: group))
                      .toList(),

                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C6B30),
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Add to cart - ₹${vm.calculateTotalPrice(coffee.price)}",
            ),
          ),
        ),
      ),
    );
  }
}
