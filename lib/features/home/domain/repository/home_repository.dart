import 'package:flower_app/features/home/domain/entity/best_seller_entity.dart';
import 'package:flower_app/features/home/domain/entity/category_entity.dart';
import 'package:flower_app/features/home/domain/entity/occasion_entity.dart';
import 'package:flower_app/features/home/domain/entity/product_entity.dart';

abstract class HomeRepository {
  Future<List<CategoryEntity>> categories();
  Future<List<BestSellerEntity>> bestSellers();
  Future<List<OccasionEntity>> occasions();

  // Make categoryId optional
  Future<List<ProductEntity>> products(String category);
}