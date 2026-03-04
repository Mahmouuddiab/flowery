import 'package:flower_app/features/home/domain/entity/occasion_entity.dart';

class OccasionModel extends OccasionEntity {
  OccasionModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory OccasionModel.fromJson(Map<String, dynamic> json) {
    return OccasionModel(
      id: json['_id '] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

}