import 'package:flower_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flower_app/features/auth/presentation/screens/register_screen.dart';
import 'package:flower_app/root.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.root:
        return MaterialPageRoute(builder: (_) => Root());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(body: Center(child: Text("Not Found"))),
        );
    }
  }
}
