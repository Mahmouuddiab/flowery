import 'package:flower_app/features/cart/domain/usecase/add_to_cart_usecase.dart';
import 'package:flower_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {

  final AddToCartUseCase addToCartUseCase;

  CartCubit(this.addToCartUseCase) : super(CartInitial());

  Future<void> addProductToCart(String productId,BuildContext context) async {

    emit(CartLoading());

    try {

      await addToCartUseCase(
        CartEntity(
          productId: productId,
          quantity: 1,
        ),
      );

      emit(CartSuccess());
      // ✅ Show SnackBar for success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added to cart"),
          backgroundColor: Colors.green,
        ),
      );

    } catch (e) {
      emit(CartError(e.toString()));
      // ✅ Show SnackBar for error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}