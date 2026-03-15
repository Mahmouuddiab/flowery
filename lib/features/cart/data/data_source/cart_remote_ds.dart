import 'package:flower_app/features/cart/data/models/cart_model.dart';
import 'package:flower_app/features/cart/data/models/user_cart_model.dart';

abstract class CartRemoteDs {
  Future<CartModel> addToCart(String token, String productId, int quantity);
  Future<UserCartModel> getCart(String token);
  Future<void> deleteCartItem(String token, String id);
}
