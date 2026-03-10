import 'package:flower_app/core/router/app_router.dart';
import 'package:flower_app/core/router/app_routes.dart';
import 'package:flower_app/core/services/easy_loading.dart';
import 'package:flower_app/core/theme/theme.dart';
import 'package:flower_app/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/di/di.dart';

void main() {
  configureDependencies();
  ConfigLoading().showLoading();
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          builder: EasyLoading.init(),
          title: 'Flower App',
          theme: AppThemes.lightMode,
          darkTheme: AppThemes.darkMode,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRouter.generateRoute,
        ) ;
      },
    );
  }
}
