import 'package:flower_app/features/home/domain/entity/best_seller_entity.dart';
import 'package:flower_app/features/home/domain/entity/category_entity.dart';
import 'package:flower_app/features/home/domain/entity/occasion_entity.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoading extends HomeStates{}
class HomeLoaded extends HomeStates {
  final List<CategoryEntity> categories;
  final List<BestSellerEntity> bestSellers;
  final List<OccasionEntity> occasions;
  HomeLoaded({
    required this.categories,
    required this.bestSellers,
    required this.occasions
  });
}
class HomeError extends HomeStates {
  final String message;
  HomeError(this.message);
}