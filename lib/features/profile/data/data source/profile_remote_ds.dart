import 'package:flower_app/features/profile/data/models/user_profile_model.dart';

abstract class ProfileRemoteDs {
  Future<UserProfileModel> getProfileData(String token);
}