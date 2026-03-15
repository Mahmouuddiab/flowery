// cart_repository.dart
import 'package:flower_app/features/cart/domain/entity/cart_entity.dart';
import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> addToCart(String productId, int quantity);
  Future<UserCartEntity> getCart();
  Future<void> deleteFromCart(String id);
}