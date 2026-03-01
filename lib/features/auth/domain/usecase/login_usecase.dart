import 'package:dartz/dartz.dart';
import 'package:flower_app/core/error/execptions.dart';
import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<ServerException, Unit>> call(LoginEntity loginEntity)=> authRepository.login(loginEntity);
}