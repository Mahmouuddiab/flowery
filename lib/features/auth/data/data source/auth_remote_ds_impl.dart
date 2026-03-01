import 'package:dartz/dartz.dart';
import 'package:flower_app/core/cache/cache_helper.dart';
import 'package:flower_app/core/dio/dio_helper.dart';
import 'package:flower_app/features/auth/data/data%20source/auth_remote_ds.dart';
import 'package:flower_app/features/auth/data/models/UserModel.dart';
import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl implements AuthRemoteDs {
  @override
  Future<Unit> login(LoginEntity loginEntity)async{
    final response = await DioHelper.postData(
        url: "https://flower.elevateegy.com/api/v1/auth/signin",
        data: {
          "email":loginEntity.email,
          "password":loginEntity.password,
        }
    );
    if(response.statusCode == 201 || response.statusCode == 200){
      final user = UserModel.fromJson(response.data);
      final token = user.token;
      CacheHelper.saveToken(token!);
      return unit;
    }
    else{
      throw Exception("can't login ${response.statusCode}");
    }
  }

  @override
  Future<Unit> register(RegisterEntity registerEntity)async{
    final response = await DioHelper.postData(
        url: "https://flower.elevateegy.com/api/v1/auth/signup",
        data: {
          "firstName":registerEntity.firstName,
          "lastName":registerEntity.lastName,
          "email":registerEntity.email,
          "password":registerEntity.password,
          "rePassword":registerEntity.rePassword,
          "phone":registerEntity.phone,
          "gender":registerEntity.gender
        }
    );
    if(response.statusCode == 201 || response.statusCode == 200){
      final user = UserModel.fromJson(response.data);
      return unit ;
    }
    else{
      throw Exception("can't register ${response.statusCode}");
    }
  }

}