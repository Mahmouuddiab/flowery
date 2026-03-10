import 'package:flower_app/features/profile/domain/entity/user_profile_entity.dart';
import 'package:flower_app/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository repository;

  ProfileUseCase(this.repository);

  Future<UserProfileEntity> call() async {
    return await repository.getProfile();
  }
}