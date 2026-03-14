import 'package:flower_app/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDs {
  Future<CartModel> addToCart(String token, String productId, int quantity);
}
