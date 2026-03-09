import 'package:flower_app/features/home/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.imgCover,
    required super.price,
    required super.priceAfterDiscount,
    required super.category,
    required super.images,
    required super.description
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? "",
      title: json['title'] ?? "",
      imgCover: json['imgCover'] ?? "",
      price: json['price'] ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'] ?? json['price'] ?? 0,
      description: json['description'] ?? "",
      category: json['category'] is Map
          ? json['category']['_id'] ?? ""
          : json['category'] ?? "",
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}
