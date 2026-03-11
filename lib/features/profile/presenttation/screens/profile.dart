import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/features/profile/presenttation/cubit/profile_states.dart';
import 'package:flower_app/features/profile/presenttation/widgets/profile_info_card.dart';
import 'package:flower_app/shared/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {

   ProfileScreen({super.key,});
     var profileCubit = getIt<ProfileCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileCubit..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          title:  Text("profile".tr()),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return CustomLoader();
            }

            if (state is ProfileLoaded) {
              final user = state.user;

              return ProfileInfoCard(user: user,);
            }

            if (state is ProfileError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}