import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/details/model/extra_option_group.dart';
import 'package:flutter_application_1/features/details/view-model/details_view_model.dart';
import 'package:provider/provider.dart';

class OptionGroupWidget extends StatelessWidget {
  final CoffeeOptionGroup group;

  const OptionGroupWidget({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CoffeeDetailsViewModel>();
    final selected = vm.selectedOptions[group.title] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),

        ...List.generate(group.options.length, (index) {
          final option = group.options[index];
          final isSelected = selected.contains(index);

          return GestureDetector(
            onTap: () => vm.selectOption(
              groupTitle: group.title,
              index: index,
              type: group.selectionType,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF9C6B30)
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? const Center(
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Color(0xFF9C6B30),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 14),
                      Text(option.title),
                    ],
                  ),
                  Text(
                    "+ ₹${option.price}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 24),
      ],
    );
  }
}
