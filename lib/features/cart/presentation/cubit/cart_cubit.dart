import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/user_cart_entity.dart';
import '../../domain/usecase/add_to_cart_usecase.dart';
import '../../domain/usecase/get_cart_usecase.dart';
import '../../domain/usecase/delete_from_cart_usecase.dart';
import 'cart_states.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final DeleteFromCartUseCase deleteFromCartUseCase;

  CartCubit(this.addToCartUseCase, this.getCartUseCase, this.deleteFromCartUseCase)
      : super(CartInitial());

  // ---------------- Add Product ----------------
  Future<void> addProductToCart(String productId, BuildContext context) async {
    emit(AddTOCartLoading());
    try {
      await addToCartUseCase(CartEntity(productId: productId, quantity: 1));
      emit(AddToCartSuccess());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added to cart"),
          backgroundColor: Colors.green,
        ),
      );
      // Refresh cart after adding
      await getUserCart();
    } catch (e) {
      emit(AddToCartError(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ---------------- Get Cart ----------------
  Future<void> getUserCart() async {
    emit(GetCartLoading());
    try {
      final cart = await getCartUseCase();
      emit(GetCartLoaded(cart: cart));
    } catch (e) {
      emit(GetCartError(message: e.toString()));
    }
  }

  // ---------------- Delete Product ----------------
  Future<void> deleteProductFromCart(String cartItemId) async {
    final currentState = state;
    if (currentState is GetCartLoaded) {
      try {
        // Optimistic UI: remove item locally
        final updatedItems = currentState.cart.cartItems
            .where((item) => item.id != cartItemId)
            .toList();

        emit(GetCartLoaded(
          cart: UserCartEntity(
            id: currentState.cart.id,
            user: currentState.cart.user,
            cartItems: updatedItems,
            appliedCoupons: currentState.cart.appliedCoupons,
            totalPrice: updatedItems.fold(0, (sum, item) => sum + (item.price * item.quantity)),
            createdAt: currentState.cart.createdAt,
            updatedAt: DateTime.now(),
            v: currentState.cart.v,
          ),
        ));

        // API call to delete from backend
        await deleteFromCartUseCase(cartItemId);

        // 🔄 Refresh cart from backend to avoid empty UI
        await getUserCart();

        emit(CartActionSuccess(message: "Product removed from cart"));
      } catch (e) {
        emit(CartActionError(message: e.toString()));
      }
    }
  }

  // ---------------- Increase Quantity Locally ----------------
  void increaseQuantity(CartItem item) {
    final currentState = state;
    if (currentState is GetCartLoaded) {
      final updatedItems = currentState.cart.cartItems.map((cartItem) {
        if (cartItem.id == item.id) {
          return CartItem(
            id: cartItem.id,
            product: cartItem.product,
            price: cartItem.price,
            quantity: cartItem.quantity + 1,
          );
        }
        return cartItem;
      }).toList();

      _emitUpdatedCart(currentState.cart, updatedItems);
    }
  }

  // ---------------- Decrease Quantity Locally ----------------
  void decreaseQuantity(CartItem item) {
    final currentState = state;
    if (currentState is GetCartLoaded) {
      final updatedItems = currentState.cart.cartItems.map((cartItem) {
        if (cartItem.id == item.id) {
          final newQuantity = (cartItem.quantity - 1).clamp(1, cartItem.quantity);
          return CartItem(
            id: cartItem.id,
            product: cartItem.product,
            price: cartItem.price,
            quantity: newQuantity,
          );
        }
        return cartItem;
      }).toList();

      _emitUpdatedCart(currentState.cart, updatedItems);
    }
  }

  // ---------------- Helper: Emit updated cart ----------------
  void _emitUpdatedCart(UserCartEntity oldCart, List<CartItem> updatedItems) {
    final updatedCart = UserCartEntity(
      id: oldCart.id,
      user: oldCart.user,
      cartItems: updatedItems,
      appliedCoupons: oldCart.appliedCoupons,
      totalPrice: updatedItems.fold(0, (sum, item) => sum + (item.price * item.quantity)),
      createdAt: oldCart.createdAt,
      updatedAt: DateTime.now(),
      v: oldCart.v,
    );

    emit(GetCartLoaded(cart: updatedCart));
  }
}