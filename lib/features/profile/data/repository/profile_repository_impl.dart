import 'package:flower_app/core/cache/cache_helper.dart';
import 'package:flower_app/features/profile/domain/entity/user_profile_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repository/profile_repository.dart';
import '../data source/profile_remote_ds.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDs remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserProfileEntity> getProfile() async {
    final token = await CacheHelper.getToken();

    if (token == null) {
      throw Exception("Token not found");
    }

    return await remoteDataSource.getProfileData(token);
  }
}