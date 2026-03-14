import 'package:flower_app/features/cart/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {

  CartModel({
    required super.productId,
    required super.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['_id'] ?? "",
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": productId,
      "quantity": quantity,
    };
  }
}