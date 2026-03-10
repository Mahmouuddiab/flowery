import 'package:flower_app/features/profile/presenttation/cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repository/profile_repository.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final  user = await repository.getProfile();
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}