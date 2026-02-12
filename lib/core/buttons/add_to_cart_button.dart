import 'package:flutter/material.dart';

class CartQuantityButton extends StatefulWidget {
  final bool showAddButtonInitially;

  const CartQuantityButton({super.key, this.showAddButtonInitially = true});

  @override
  State<CartQuantityButton> createState() => _CartQuantityButtonState();
}

class _CartQuantityButtonState extends State<CartQuantityButton> {
  late int quantity;

  @override
  void initState() {
    super.initState();

    quantity = widget.showAddButtonInitially ? 0 : 1;
  }

  void _add() {
    setState(() {
      quantity++;
    });
  }

  void _remove() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else if (widget.showAddButtonInitially) {
        quantity = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final bool shouldShowAddButton =
        widget.showAddButtonInitially && quantity == 0;

    // ADD TO CART (DEFAULT)
    if (shouldShowAddButton) {
      return SizedBox(
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              quantity = 1;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text('Add to Cart', style: TextStyle(fontSize: 12)),
        ),
      );
    }

    // COUNTER
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            iconSize: 14,
            padding: EdgeInsets.zero,
            onPressed: _remove,
            icon: Icon(Icons.remove, color: colors.onPrimary),
          ),
          Text(
            '$quantity',
            style: TextStyle(
              color: colors.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            iconSize: 14,
            padding: EdgeInsets.zero,
            onPressed: _add,
            icon: Icon(Icons.add, color: colors.onPrimary),
          ),
        ],
      ),
    );
  }
}
