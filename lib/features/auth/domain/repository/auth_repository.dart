import 'package:dartz/dartz.dart';
import 'package:flower_app/core/error/execptions.dart';
import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';

abstract class AuthRepository {
  Future<Either<ServerException,Unit>> register(RegisterEntity registerEntity);
  Future<Either<ServerException,Unit>> login(LoginEntity loginEntity);
}