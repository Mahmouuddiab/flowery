import 'package:dartz/dartz.dart';
import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';

abstract class AuthRemoteDs {
  Future<Unit> register(RegisterEntity registerEntity);
  Future<Unit> login(LoginEntity loginEntity);
}