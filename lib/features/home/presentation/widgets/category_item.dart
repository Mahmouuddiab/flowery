import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/features/home/domain/entity/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.lightPink,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Image.network(
              category.image,
              height: 36,
              width: 36,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.primary,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          category.name,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}