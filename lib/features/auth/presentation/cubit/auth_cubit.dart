import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';
import 'package:flower_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:flower_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:flower_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  AuthCubit(this.registerUseCase,this.loginUseCase):super(AuthInitialState());

  Future<void> register(RegisterEntity registerEntity)async{
    final response = await registerUseCase.call(registerEntity);
    return response.fold(
        (l) {
          emit(RegisterErrorState(error: "can't register ${l.message}"));
        },
        (r) {
          emit(RegisterSuccessState());
        },
    ) ;
  }

  Future<void> login(LoginEntity loginEntity)async{
    final response = await loginUseCase.call(loginEntity);
    return response.fold(
          (l) {
        emit(LoginErrorState(error: "can't login ${l.message}"));
      },
          (r) {
        emit(LoginSuccessState());
      },
    ) ;
  }
}