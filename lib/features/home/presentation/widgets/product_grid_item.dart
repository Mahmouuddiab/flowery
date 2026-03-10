import 'package:flower_app/features/home/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductGridItem extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;
  final VoidCallback? onFavTap;
  final bool isFavorite;

  const ProductGridItem({
    super.key,
    required this.product,
    this.onTap,
    this.onFavTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final discountPercent = product.price > product.priceAfterDiscount
        ? (((product.price - product.priceAfterDiscount) / product.price) * 100)
        .round()
        : 0;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image Section
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: product.id,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.network(
                        product.imgCover,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// Discount Badge
                  if (discountPercent > 0)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "-$discountPercent%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  /// Favorite Button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: onFavTap,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          isFavorite
                              ? Icons.shopping_cart
                              : Icons.add_shopping_cart,
                          size: 18,
                          color:
                          isFavorite ? Colors.red : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Info Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 6),

                  /// Price Row
                  Row(
                    children: [
                      Text(
                        "\$${product.priceAfterDiscount}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 6),
                      if (product.price > product.priceAfterDiscount)
                        Text(
                          "\$${product.price}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}