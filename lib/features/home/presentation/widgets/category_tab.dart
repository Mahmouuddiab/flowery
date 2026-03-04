import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.category,
    this.onTap,
  });

  final int selectedIndex;
  final List<CategoryEntity> category;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(index);
              }
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: isSelected
                    ? AppColors.primary
                    : const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                category[index].name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color:
                  isSelected ? Colors.white : Colors.grey.shade700,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}