import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/coffee/model/coffee_model.dart';
import 'package:flutter_application_1/features/cart/widgets/add_to_cart_button.dart';

import 'like_button.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeItem coffee;
  final VoidCallback onTap;

  const CoffeeCard({super.key, required this.coffee, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap, 
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE + LIKE
              AspectRatio(
                aspectRatio: 1.1,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: SizedBox.expand(
                        child: Image.network(
                          coffee.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: colors.surfaceContainerHighest,
                            );
                          },
                        ),
                      ),
                    ),
                    const Positioned(top: 8, right: 8, child: LikeButton()),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              // TITLE
              Text(
                coffee.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors.primary,
                ),
              ),

              const SizedBox(height: 5),

              // DESCRIPTION
              SizedBox(
                height: 32,
                child: Text(
                  coffee.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: colors.onSurface),
                ),
              ),

              const SizedBox(height: 8),

              // PRICE + CART
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${coffee.price}',
                    style: TextStyle(
                      fontSize: 14,
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
      ),
    );
  }
}
