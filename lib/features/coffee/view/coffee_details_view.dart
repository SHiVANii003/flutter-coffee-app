import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/widgets/add_to_cart_button.dart';
import '../model/coffee_model.dart';
import '../widgets/like_button.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  final CoffeeItem coffee;

  const CoffeeDetailsScreen({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    Image.network(
                      coffee.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(top: 16, right: 16, child: LikeButton()),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAME
                    Text(
                      coffee.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colors.primary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // DESCRIPTION
                    Text(
                      coffee.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: colors.onSurface.withValues(alpha: 0.7),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // PRICE + CART
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${coffee.price}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: colors.primary,
                          ),
                        ),
                        const CartQuantityButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
