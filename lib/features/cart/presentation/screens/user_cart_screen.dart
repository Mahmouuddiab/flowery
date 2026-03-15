import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flower_app/shared/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flower_app/features/cart/presentation/cubit/cart_states.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (_) => getIt<CartCubit>()..getUserCart(), // inject cubit and fetch cart
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            // Loading
            if (state is GetCartLoading) {
              return const CustomLoader();
            }

            // Error
            if (state is GetCartError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // Cart Loaded
            if (state is GetCartLoaded) {
              final cartItems = state.cart.cartItems;
              final totalPrice = cartItems.fold(
                0,
                    (sum, item) => sum + (item.price * item.quantity),
              );

              if (cartItems.isEmpty) {
                return const Center(child: Text('Your cart is empty'));
              }

              else{
                return  ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartItems.length + 1, // 🔥 add extra item
                  separatorBuilder: (_, __) => const SizedBox(height: 16),

                  itemBuilder: (_, index) {

                    /// CART ITEMS
                    if (index < cartItems.length) {
                      final item = cartItems[index];

                      return CartItemWidget(
                        cartItem: item,
                      );
                    }

                    /// TOTAL PRICE CONTAINER (LAST ITEM)
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "$totalPrice SAR",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );;
              }
            }

            // Default empty state
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}