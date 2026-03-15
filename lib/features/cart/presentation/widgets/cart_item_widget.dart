import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_strings.dart';
import 'package:flower_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';
import 'package:flower_app/features/cart/presentation/cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart".tr()),
      ),
      body: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          // Show SnackBars for success or error actions
          if (state is CartActionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state is CartActionError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartLoading || state is CartInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetCartLoaded) {
              final cartItems = state.cart.cartItems;
              if (cartItems.isEmpty) {
                return Center(child: Text("Your cart is empty".tr()));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItemWidget(cartItem: item);
                },
              );
            } else if (state is GetCartError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;
    final cartCubit = context.read<CartCubit>();

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.imgCover,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title and Delete Icon
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _showDeleteDialog(context, cartItem, cartCubit),
                        icon: BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            if (state is CartActionSuccess && state.message.contains(cartItem.id)) {
                              return const SizedBox(
                                width: 23,
                                height: 23,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              );
                            }
                            return Icon(Icons.delete, size: 23, color: AppColors.red);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Quantity and Price
                  Row(
                    children: [
                      // Decrease Button
                      IconButton(
                        onPressed: () => cartCubit.decreaseQuantity(cartItem),
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      // Quantity
                      Text(
                        cartItem.quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      // Increase Button
                      IconButton(
                        onPressed: () => cartCubit.increaseQuantity(cartItem),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                      const Spacer(),
                      // Price
                      Text(
                        "${cartItem.price * cartItem.quantity} SAR",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
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

/// Delete Product From Cart DIALOG
void _showDeleteDialog(BuildContext context, CartItem cartItem, CartCubit cartCubit) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppStrings.delete.tr()),
        content: Text("are you sure you want to delete this item?").tr(),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel".tr()),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog first
              cartCubit.deleteProductFromCart(cartItem.id); // Cubit handles state, no context
            },
            child: Text(
              AppStrings.delete.tr(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}