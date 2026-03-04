import 'package:flower_app/features/home/domain/entity/occasion_entity.dart';
import 'package:flower_app/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionUseCase {
  HomeRepository homeRepository;
  OccasionUseCase({required this.homeRepository});
  Future<List<OccasionEntity>> call()=> homeRepository.occasions();
}