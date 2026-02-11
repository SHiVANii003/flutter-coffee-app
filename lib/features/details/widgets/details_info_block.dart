import 'package:flutter/material.dart';
import '../../cart/widgets/add_to_cart_button.dart';

class DetailsInfoBlock extends StatelessWidget {
  final int price;

  const DetailsInfoBlock({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Price",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(
                "₹$price",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Column(
            children: [
              Text(
                "Rating",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 4),
                  Text("4.5"),
                ],
              ),
            ],
          ),
          const Column(
            children: [
              Text(
                "Quantity",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 6),
              CartQuantityButton(),
            ],
          ),
        ],
      ),
    );
  }
}
