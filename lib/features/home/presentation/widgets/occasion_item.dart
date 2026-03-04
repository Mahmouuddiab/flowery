import 'package:flower_app/features/home/domain/entity/occasion_entity.dart';
import 'package:flutter/material.dart';

class OccasionItem extends StatelessWidget {
  final OccasionEntity occasionEntity;
  final VoidCallback? onTap;
   OccasionItem({super.key,required this.occasionEntity,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 180,
        child: Column(
          spacing: 10,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                    color: Colors.black.withOpacity(0.08),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://flower.elevateegy.com/uploads/" + occasionEntity.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 140,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),
            Text(
              occasionEntity.name,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
