import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/model/coffee_model.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeItem coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // IMAGE 
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 70,
              height: 70,
              child: Image.network(
                coffee.imageUrl,
                fit: BoxFit.cover,

                // Loading state
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Container(
                    color: colors.surface,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.primary,
                      ),
                    ),
                  );
                },

                // Error fallback 
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: colors.surface,
                    child: Icon(Icons.coffee, color: colors.primary, size: 28),
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 16),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  coffee.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onSurface,
                  ),
                ),
              ],
            ),
          ),

          // PRICE
          Text(
            '₹${coffee.price}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
