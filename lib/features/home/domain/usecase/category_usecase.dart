import 'package:flower_app/features/home/domain/entity/category_entity.dart';
import 'package:flower_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUseCase {
  HomeRepository homeRepository;
  CategoryUseCase({required this.homeRepository});
  Future<List<CategoryEntity>> call()=> homeRepository.categories();
}