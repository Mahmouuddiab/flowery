import 'package:dio/dio.dart';
import 'package:flower_app/core/dio/dio_helper.dart';
import 'package:flower_app/features/profile/data/data%20source/profile_remote_ds.dart';
import 'package:flower_app/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDs)
class ProfileRemoteDsImpl implements ProfileRemoteDs {
  @override
  Future<UserProfileModel> getProfileData(String token)async{
    final response = await DioHelper.getData(
      url: "https://flower.elevateegy.com/api/v1/auth/profile-data",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    if(response.statusCode == 200){
      return UserProfileModel.fromJson(response.data['user']);
    }
    else{
      throw Exception("${response.statusCode}");
    }
  }

}