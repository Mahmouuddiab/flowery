import 'package:flower_app/features/cart/domain/entity/cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> addToCart(String productId, int quantity);
}