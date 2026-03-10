import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:flower_app/features/home/presentation/screens/category_screen.dart';
import 'package:flower_app/features/home/presentation/screens/home.dart';
import 'package:flower_app/features/profile/presenttation/screens/profile.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;

  final List<Widget> screens = [Home(),CategoryScreen(),CartScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(4, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(AppImages.homeIcon, 0),
            navItem(AppImages.categoryIcon, 1),
            navItem(AppImages.cartIcon, 2),
            navItem(AppImages.profileIcon, 3)
          ],
        ),
      ),
    );
  }

  Widget navItem(String imagePath, int index) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath,
          width: 28,
          height: 28,
          color: isSelected
              ? AppColors.white
              : AppColors.gray,
        ),
      ),
    );
  }
}