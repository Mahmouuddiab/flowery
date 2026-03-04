import 'package:flower_app/features/home/domain/entity/product_entity.dart';
import 'package:flower_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase {
  final HomeRepository homeRepository;

  ProductUseCase({required this.homeRepository});

  // Make categoryId optional
  Future<List<ProductEntity>> call(String category) {
    return homeRepository.products(category);
  }
}