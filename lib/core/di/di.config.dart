// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data%20source/auth_remote_ds.dart' as _i6;
import '../../features/auth/data/data%20source/auth_remote_ds_impl.dart'
    as _i624;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/register_usecase.dart' as _i769;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/home/data/data%20source/home_remote_ds.dart' as _i520;
import '../../features/home/data/data%20source/home_remote_ds_impl.dart'
    as _i740;
import '../../features/home/data/repository/home_repository_impl.dart' as _i9;
import '../../features/home/domain/repository/home_repository.dart' as _i541;
import '../../features/home/domain/usecase/best_seller_usecase.dart' as _i484;
import '../../features/home/domain/usecase/category_usecase.dart' as _i589;
import '../../features/home/domain/usecase/occasion_usecase.dart' as _i739;
import '../../features/home/domain/usecase/product_usecase.dart' as _i1022;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/profile/data/data%20source/profile_remote_ds.dart'
    as _i640;
import '../../features/profile/data/data%20source/profile_remote_ds_impl.dart'
    as _i56;
import '../../features/profile/data/repository/profile_repository_impl.dart'
    as _i309;
import '../../features/profile/domain/repository/profile_repository.dart'
    as _i364;
import '../../features/profile/domain/usecase/profile_usecase.dart' as _i721;
import '../../features/profile/presenttation/cubit/profile_cubit.dart' as _i562;
import '../dio/dio_helper.dart' as _i676;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i676.DioHelper>(() => _i676.DioHelper());
    gh.factory<_i640.ProfileRemoteDs>(() => _i56.ProfileRemoteDsImpl());
    gh.factory<_i520.HomeRemoteDs>(() => _i740.HomeRemoteDsImpl());
    gh.factory<_i6.AuthRemoteDs>(() => _i624.AuthRemoteDsImpl());
    gh.factory<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(authRemoteDs: gh<_i6.AuthRemoteDs>()),
    );
    gh.factory<_i364.ProfileRepository>(
      () => _i309.ProfileRepositoryImpl(gh<_i640.ProfileRemoteDs>()),
    );
    gh.factory<_i541.HomeRepository>(
      () => _i9.HomeRepositoryImpl(homeRemoteDs: gh<_i520.HomeRemoteDs>()),
    );
    gh.factory<_i721.ProfileUseCase>(
      () => _i721.ProfileUseCase(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i562.ProfileCubit>(
      () => _i562.ProfileCubit(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i911.LoginUseCase>(
      () => _i911.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i769.RegisterUseCase>(
      () => _i769.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i484.BestSellerUseCase>(
      () => _i484.BestSellerUseCase(homeRepository: gh<_i541.HomeRepository>()),
    );
    gh.factory<_i589.CategoryUseCase>(
      () => _i589.CategoryUseCase(homeRepository: gh<_i541.HomeRepository>()),
    );
    gh.factory<_i739.OccasionUseCase>(
      () => _i739.OccasionUseCase(homeRepository: gh<_i541.HomeRepository>()),
    );
    gh.factory<_i1022.ProductUseCase>(
      () => _i1022.ProductUseCase(homeRepository: gh<_i541.HomeRepository>()),
    );
    gh.factory<_i9.HomeCubit>(
      () => _i9.HomeCubit(
        gh<_i589.CategoryUseCase>(),
        gh<_i484.BestSellerUseCase>(),
        gh<_i739.OccasionUseCase>(),
        gh<_i1022.ProductUseCase>(),
      ),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        gh<_i769.RegisterUseCase>(),
        gh<_i911.LoginUseCase>(),
      ),
    );
    return this;
  }
}
