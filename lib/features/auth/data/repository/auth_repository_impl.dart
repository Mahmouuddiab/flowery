import 'package:dartz/dartz.dart';
import 'package:flower_app/core/error/execptions.dart';
import 'package:flower_app/features/auth/data/data%20source/auth_remote_ds.dart';
import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';
import 'package:flower_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDs authRemoteDs;
  AuthRepositoryImpl({required this.authRemoteDs});
  @override
  Future<Either<ServerException, Unit>> login(LoginEntity loginEntity)async{
    await authRemoteDs.login(loginEntity);
    return Right(unit) ;
  }

  @override
  Future<Either<ServerException, Unit>> register(RegisterEntity registerEntity)async{
    await authRemoteDs.register(registerEntity);
    return Right(unit) ;
  }

}