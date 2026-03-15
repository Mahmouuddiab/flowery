import 'package:equatable/equatable.dart';
import '../../domain/entity/user_cart_entity.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class AddTOCartLoading extends CartState {}
class AddToCartSuccess extends CartState {}
class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);

  @override
  List<Object?> get props => [message];
}

class GetCartLoading extends CartState {}
class GetCartLoaded extends CartState {
  final UserCartEntity cart;
  GetCartLoaded({required this.cart});

  @override
  List<Object?> get props => [cart];
}
class GetCartError extends CartState {
  final String message;
  GetCartError({required this.message});

  @override
  List<Object?> get props => [message];
}


class CartActionSuccess extends CartState {
  final String message;
  CartActionSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}
class CartActionError extends CartState {
  final String message;
  CartActionError({required this.message});

  @override
  List<Object?> get props => [message];
}