import 'package:dartz/dartz.dart';
import 'package:flower_app/core/error/execptions.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';
import 'package:flower_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<ServerException, Unit>> call(RegisterEntity registerEntity)=> authRepository.register(registerEntity);
}