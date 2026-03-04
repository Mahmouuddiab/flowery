import 'package:flower_app/features/home/data/models/best_seller_model.dart';
import 'package:flower_app/features/home/data/models/category_model.dart';
import 'package:flower_app/features/home/data/models/occasion_model.dart';
import 'package:flower_app/features/home/data/models/product_model.dart';

abstract class HomeRemoteDs {
  Future<List<CategoryModel>> categories();
  Future<List<BestSellerModel>> bestSellers();
  Future<List<OccasionModel>> occasions();
  Future<List<ProductModel>> products(String category);
}