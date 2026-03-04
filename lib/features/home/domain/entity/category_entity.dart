import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    this.productsCount,
  });

  String id;
  String name;
  String slug;
  String image;
  num? productsCount;

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}