import 'package:flower_app/features/profile/domain/entity/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getProfile();
}