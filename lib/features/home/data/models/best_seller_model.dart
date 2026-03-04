import 'package:flower_app/features/home/domain/entity/best_seller_entity.dart';

class BestSellerModel extends BestSellerEntity {
  BestSellerModel({
    required super.id,
    required super.title,
    required super.price,
    super.imgCover,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',        // ✅ protect null
      price: json['price'] ?? 0,
      imgCover: json['imgCover'],        // nullable is fine
    );
  }
}