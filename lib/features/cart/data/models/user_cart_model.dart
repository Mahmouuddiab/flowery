import 'package:flower_app/features/cart/domain/entity/user_cart_entity.dart';

class UserCartModel extends UserCartEntity {
  UserCartModel({
    required super.id,
    required super.user,
    required super.cartItems,
    required super.appliedCoupons,
    required super.totalPrice,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

  factory UserCartModel.fromJson(Map<String, dynamic> json) {
    final cartJson = json['cart'] ?? {}; // get the nested cart object

    return UserCartModel(
      id: cartJson['_id'] ?? '',
      user: cartJson['user'] ?? '',
      cartItems: (cartJson['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      appliedCoupons: (cartJson['appliedCoupons'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      totalPrice: cartJson['totalPrice'] ?? 0,
      createdAt: cartJson['createdAt'] != null
          ? DateTime.parse(cartJson['createdAt'])
          : DateTime.now(),
      updatedAt: cartJson['updatedAt'] != null
          ? DateTime.parse(cartJson['updatedAt'])
          : DateTime.now(),
      v: cartJson['__v'] ?? 0,
    );
  }
}

class CartItemModel extends CartItem {
  CartItemModel({
    required super.product,
    required super.price,
    required super.quantity,
    required super.id,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product'] ?? {}),
      price: json['price'] ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      id: json['_id'] ?? '',
    );
  }
}

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imgCover,
    required super.images,
    required super.price,
    required super.priceAfterDiscount,
    required super.quantity,
    required super.category,
    required super.rateAvg,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? '',
      imgCover: json['imgCover'] ?? 'https://via.placeholder.com/80',
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      price: json['price'] ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'] ?? 0,
      quantity: json['quantity'] ?? 0,
      category: json['category'] ?? 'Unknown',
      rateAvg: (json['rateAvg'] ?? 0).toDouble(),
    );
  }
}