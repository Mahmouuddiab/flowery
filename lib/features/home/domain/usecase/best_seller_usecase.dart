import 'package:flower_app/features/home/domain/entity/best_seller_entity.dart';
import 'package:flower_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BestSellerUseCase {
  HomeRepository homeRepository;
  BestSellerUseCase({required this.homeRepository});
  Future<List<BestSellerEntity>> call()=> homeRepository.bestSellers();
}