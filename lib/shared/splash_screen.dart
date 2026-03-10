import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flower_app/root.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller for curve animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Curved animation (easeInOut)
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Navigate to home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ), // replace with your main screen
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // base background
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              // Pink curved container
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 200 * _animation.value, // animated height
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150),
                      topRight: Radius.circular(150),
                    ),
                  ),
                ),
              ),
              // App logo or name in center
              Center(
                child: FadeTransition(
                  opacity: _animation,
                  child: SizedBox(
                      height: 170,
                      width: 200,
                      child: SvgPicture.asset(AppImages.logo)
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
