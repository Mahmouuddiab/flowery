class UserCartEntity {
  final String id;
  final String user;
  final List<CartItem> cartItems;
  final List<String> appliedCoupons;
  final int totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserCartEntity({
    required this.id,
    required this.user,
    required this.cartItems,
    required this.appliedCoupons,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}

class CartItem {
  final Product product;
  final int price;
  final int quantity;
  final String id;

  CartItem({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });
}

class Product {
  final String id;
  final String title;
  final String imgCover;
  final num price;
  final num priceAfterDiscount;
  final String category;
  final List<String> images;
  final String description;
  final int quantity;
  final double rateAvg;

  Product({
    required this.id,
    required this.title,
    required this.imgCover,
    required this.price,
    required this.priceAfterDiscount,
    required this.category,
    required this.images,
    required this.description,
    required this.quantity,
    required this.rateAvg
  });
}